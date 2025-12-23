import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:english_vocab_app/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../db/database_helper.dart';
import '../models/word.dart';
import '../services/translation_service.dart';
import '../services/ad_service.dart';
import '../utils/pos_helper.dart';
import 'word_detail_screen.dart';

class WordListScreen extends StatefulWidget {
  final String? level;
  final bool isFlashcardMode;

  const WordListScreen({super.key, this.level, this.isFlashcardMode = false});

  @override
  State<WordListScreen> createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  List<Word> _words = [];
  bool _isLoading = true;
  int _currentFlashcardIndex = 0;
  late PageController _pageController;
  String _sortOrder = 'alphabetical'; // 'alphabetical' or 'random'
  bool _isBannerAdLoaded = false;
  int _flashcardViewCount = 0;
  double _wordFontSize = 1.0;
  bool _showNativeLanguage = true;

  // 페이지네이션
  int _currentPage = 0;
  int _totalWords = 0;
  static const int _pageSize = 50;
  bool _isLoadingPage = false;

  // 리스트 모드 스크롤 컨트롤러
  final ScrollController _listScrollController = ScrollController();
  int _lastListPosition = 0;

  // 번역 관련
  Map<int, String> _translatedDefinitions = {};
  Map<int, String> _translatedExamples = {};
  Set<int> _loadingTranslations = {};
  bool _apiNoticeShown = false;

  // 위치 저장 키
  String get _positionKey =>
      'word_list_position_${widget.level ?? 'all'}_${widget.isFlashcardMode ? 'flashcard' : 'list'}';

  // 페이지 저장 키 (리스트 모드)
  String get _pageKey => 'word_list_page_${widget.level ?? 'all'}';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadWords();
    _loadBannerAd();
    _loadInterstitialAd();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _wordFontSize = prefs.getDouble('wordFontSize') ?? 1.0;
    });
  }

  Future<void> _loadInterstitialAd() async {
    if (widget.isFlashcardMode) {
      await AdService.instance.loadInterstitialAd();
    }
  }

  Future<void> _loadBannerAd() async {
    final adService = AdService.instance;
    await adService.initialize();

    if (!adService.adsRemoved) {
      await adService.loadBannerAd(
        onLoaded: () {
          if (mounted) {
            setState(() {
              _isBannerAdLoaded = true;
            });
          }
        },
      );
    }
  }

  Future<void> _loadWords() async {
    // 플래시카드 모드는 기존 방식 유지 (전체 로드)
    if (widget.isFlashcardMode) {
      List<Word> words;
      if (widget.level != null) {
        words = await DatabaseHelper.instance.getWordsByLevel(widget.level!);
      } else {
        words = await DatabaseHelper.instance.getAllWords();
      }

      final prefs = await SharedPreferences.getInstance();
      final savedPosition = prefs.getInt(_positionKey) ?? 0;

      setState(() {
        _words = words;
        _isLoading = false;
      });

      if (words.isNotEmpty) {
        final position = savedPosition.clamp(0, words.length - 1);
        _currentFlashcardIndex = position;
        _pageController = PageController(initialPage: position);
        setState(() {});
      }
    } else {
      // 리스트 모드는 페이지네이션 사용
      _totalWords = await DatabaseHelper.instance.getWordsCount(
        level: widget.level,
      );

      // 저장된 페이지 위치 복원
      final prefs = await SharedPreferences.getInstance();
      final savedPage = prefs.getInt(_pageKey) ?? 0;
      final maxPage = (_totalWords / _pageSize).ceil() - 1;
      final initialPage = savedPage.clamp(0, maxPage > 0 ? maxPage : 0);

      await _loadPage(initialPage);
    }
  }

  Future<void> _loadPage(int page) async {
    if (_isLoadingPage) return;

    setState(() {
      _isLoadingPage = true;
      if (page == 0) _isLoading = true;
    });

    final words = await DatabaseHelper.instance.getWordsPaginated(
      level: widget.level,
      page: page,
      pageSize: _pageSize,
    );

    setState(() {
      _words = words;
      _currentPage = page;
      _isLoading = false;
      _isLoadingPage = false;
    });

    // 페이지 저장
    _saveCurrentPage(page);
  }

  void _goToPage(int page) {
    final maxPage = (_totalWords / _pageSize).ceil() - 1;
    if (page < 0 || page > maxPage) return;
    _loadPage(page);
    _listScrollController.jumpTo(0);
  }

  Future<void> _saveCurrentPage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_pageKey, page);
  }

  Future<void> _savePosition(int position) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_positionKey, position);
  }

  Future<void> _loadTranslationForWord(Word word) async {
    if (_translatedDefinitions.containsKey(word.id)) return;

    final translationService = TranslationService.instance;
    await translationService.init();

    if (!translationService.needsTranslation) return;
    if (!mounted) return;

    // 내장 번역만 사용 (API 호출 없음)
    final langCode = translationService.currentLanguage;
    final embeddedDef = word.getEmbeddedTranslation(langCode, 'definition');
    final embeddedEx = word.getEmbeddedTranslation(langCode, 'example');

    if (!mounted) return;
    setState(() {
      if (embeddedDef != null && embeddedDef.isNotEmpty) {
        _translatedDefinitions[word.id] = embeddedDef;
      }
      if (embeddedEx != null && embeddedEx.isNotEmpty) {
        _translatedExamples[word.id] = embeddedEx;
      }
    });
  }

  void _sortWords(String order) {
    // ���� ���� �ִ� �ܾ� ����
    final currentWord =
        _words.isNotEmpty ? _words[_currentFlashcardIndex] : null;

    setState(() {
      _sortOrder = order;
      if (order == 'alphabetical') {
        _words.sort(
          (a, b) => a.word.toLowerCase().compareTo(b.word.toLowerCase()),
        );
      } else if (order == 'random') {
        _words.shuffle();
      }

      // ���� ���� �ִ� �ܾ��� �� ��ġ ã��
      if (currentWord != null) {
        final newIndex = _words.indexWhere((w) => w.id == currentWord.id);
        _currentFlashcardIndex = newIndex >= 0 ? newIndex : 0;
      } else {
        _currentFlashcardIndex = 0;
      }

      if (_pageController.hasClients) {
        _pageController.jumpToPage(_currentFlashcardIndex);
      }
    });
  }

  String _getAlphabeticalText() {
    final l10n = AppLocalizations.of(context)!;
    return l10n.alphabetical;
  }

  String _getRandomText() {
    final l10n = AppLocalizations.of(context)!;
    return l10n.random;
  }

  Future<void> _toggleFavorite(Word word) async {
    await DatabaseHelper.instance.toggleFavorite(word.id, !word.isFavorite);
    setState(() {
      word.isFavorite = !word.isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          word.isFavorite
              ? AppLocalizations.of(context)!.addedToFavorites
              : AppLocalizations.of(context)!.removedFromFavorites,
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _listScrollController.dispose();
    AdService.instance.disposeBannerAd();
    // ���� �� ���� ��ġ ����
    if (widget.isFlashcardMode) {
      _savePosition(_currentFlashcardIndex);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    String title = l10n.allWords;
    if (widget.level != null) {
      title = l10n.levelWords(widget.level!);
    }
    if (widget.isFlashcardMode) {
      title = l10n.flashcard;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          // ����/�𱹾� ��ȯ ��ư
          if (_words.isNotEmpty && TranslationService.instance.needsTranslation)
            IconButton(
              icon: Icon(
                _showNativeLanguage ? Icons.translate : Icons.language,
                color:
                    _showNativeLanguage ? Theme.of(context).primaryColor : null,
              ),
              tooltip: _showNativeLanguage ? 'English' : l10n.language,
              onPressed: () {
                setState(() {
                  _showNativeLanguage = !_showNativeLanguage;
                });
              },
            ),
          // ���� �ɼ�
          if (_words.isNotEmpty)
            PopupMenuButton<String>(
              icon: const Icon(Icons.sort),
              tooltip: '����',
              onSelected: _sortWords,
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: 'alphabetical',
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort_by_alpha,
                            color:
                                _sortOrder == 'alphabetical'
                                    ? Theme.of(context).primaryColor
                                    : null,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _getAlphabeticalText(),
                            style: TextStyle(
                              fontWeight:
                                  _sortOrder == 'alphabetical'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'random',
                      child: Row(
                        children: [
                          Icon(
                            Icons.shuffle,
                            color:
                                _sortOrder == 'random'
                                    ? Theme.of(context).primaryColor
                                    : null,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _getRandomText(),
                            style: TextStyle(
                              fontWeight:
                                  _sortOrder == 'random'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
          if (!widget.isFlashcardMode && _words.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.style),
              tooltip: l10n.flashcardMode,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => WordListScreen(
                          level: widget.level,
                          isFlashcardMode: true,
                        ),
                  ),
                );
              },
            ),
          if (widget.isFlashcardMode && _words.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.list),
              tooltip: l10n.listMode,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => WordListScreen(
                          level: widget.level,
                          isFlashcardMode: false,
                        ),
                  ),
                );
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _words.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.inbox, size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            l10n.noWords,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                    : widget.isFlashcardMode
                    ? _buildFlashcardMode()
                    : _buildListMode(),
          ),
          _buildBannerAd(),
        ],
      ),
    );
  }

  Widget _buildBannerAd() {
    final adService = AdService.instance;

    if (adService.adsRemoved ||
        !_isBannerAdLoaded ||
        adService.bannerAd == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: adService.bannerAd!.size.width.toDouble(),
      height: adService.bannerAd!.size.height.toDouble(),
      alignment: Alignment.center,
      child: AdWidget(ad: adService.bannerAd!),
    );
  }

  Widget _buildListMode() {
    final maxPage = (_totalWords / _pageSize).ceil() - 1;
    final startIndex = _currentPage * _pageSize + 1;
    final endIndex = (startIndex + _words.length - 1).clamp(1, _totalWords);

    return Column(
      children: [
        // 페이지 네비게이션 바
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 이전 페이지
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed:
                    _currentPage > 0 ? () => _goToPage(_currentPage - 1) : null,
              ),
              // 페이지 정보
              GestureDetector(
                onTap: () => _showPageSelector(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$startIndex - $endIndex / $_totalWords',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // 다음 페이지
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed:
                    _currentPage < maxPage
                        ? () => _goToPage(_currentPage + 1)
                        : null,
              ),
            ],
          ),
        ),
        // 단어 리스트
        Expanded(
          child:
              _isLoadingPage
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    controller: _listScrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: _words.length,
                    itemBuilder: (context, index) {
                      final word = _words[index];
                      _loadTranslationForWord(word);
                      final translatedDef = _translatedDefinitions[word.id];
                      final isLoading = _loadingTranslations.contains(word.id);

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          title: Text(
                            word.word,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle:
                              isLoading && _showNativeLanguage
                                  ? Row(
                                    children: [
                                      SizedBox(
                                        width: 12,
                                        height: 12,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '...',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    _showNativeLanguage
                                        ? (translatedDef ?? '')
                                        : word.definition,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                          trailing: IconButton(
                            icon: Icon(
                              word.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: word.isFavorite ? Colors.red : null,
                            ),
                            onPressed: () => _toggleFavorite(word),
                          ),
                          onTap: () {
                            final globalIndex =
                                _currentPage * _pageSize + index;
                            _savePosition(globalIndex);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => WordDetailScreen(word: word),
                              ),
                            ).then((_) => _loadPage(_currentPage));
                          },
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }

  void _showPageSelector() {
    final maxPage = (_totalWords / _pageSize).ceil();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Go to Page'),
            content: SizedBox(
              width: double.maxFinite,
              height: 300,
              child: ListView.builder(
                itemCount: maxPage,
                itemBuilder: (context, index) {
                  final start = index * _pageSize + 1;
                  final end = ((index + 1) * _pageSize).clamp(1, _totalWords);
                  final isCurrentPage = index == _currentPage;
                  return ListTile(
                    title: Text(
                      'Page ${index + 1}: $start - $end',
                      style: TextStyle(
                        fontWeight:
                            isCurrentPage ? FontWeight.bold : FontWeight.normal,
                        color:
                            isCurrentPage
                                ? Theme.of(context).primaryColor
                                : null,
                      ),
                    ),
                    trailing:
                        isCurrentPage
                            ? const Icon(Icons.check, color: Colors.green)
                            : null,
                    onTap: () {
                      Navigator.pop(context);
                      _goToPage(index);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  Widget _buildFlashcardMode() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '${_currentFlashcardIndex + 1} / ${_words.length}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentFlashcardIndex = index;
              });
              // ��ġ ����
              _savePosition(index);

              // �÷���ī�� 10�帶�� ���� ���� ǥ��
              _flashcardViewCount++;
              if (_flashcardViewCount % 10 == 0) {
                AdService.instance.showInterstitialAd();
              }
            },
            itemCount: _words.length,
            itemBuilder: (context, index) {
              final word = _words[index];
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: _buildFlashcardFront(word),
                  back: _buildFlashcardBack(word),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Previous ��ư
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:
                      _currentFlashcardIndex > 0
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade300,
                  shape: BoxShape.circle,
                  boxShadow:
                      _currentFlashcardIndex > 0
                          ? [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(100),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : null,
                ),
                child: IconButton(
                  onPressed:
                      _currentFlashcardIndex > 0
                          ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                          : null,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color:
                        _currentFlashcardIndex > 0 ? Colors.white : Colors.grey,
                  ),
                  iconSize: 28,
                ),
              ),
              const SizedBox(width: 48),
              // Next ��ư
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:
                      _currentFlashcardIndex < _words.length - 1
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade300,
                  shape: BoxShape.circle,
                  boxShadow:
                      _currentFlashcardIndex < _words.length - 1
                          ? [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(100),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : null,
                ),
                child: IconButton(
                  onPressed:
                      _currentFlashcardIndex < _words.length - 1
                          ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                          : null,
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    color:
                        _currentFlashcardIndex < _words.length - 1
                            ? Colors.white
                            : Colors.grey,
                  ),
                  iconSize: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFlashcardFront(Word word) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withAlpha((0.7 * 255).toInt()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                word.word,
                style: TextStyle(
                  fontSize: 36 * _wordFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                translatePartOfSpeech(
                  AppLocalizations.of(context)!,
                  word.partOfSpeech,
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withAlpha((0.8 * 255).toInt()),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((0.2 * 255).toInt()),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  word.level,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                AppLocalizations.of(context)!.tapToFlip,
                style: TextStyle(
                  color: Colors.white.withAlpha((0.6 * 255).toInt()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlashcardBack(Word word) {
    // ���� �ε�
    _loadTranslationForWord(word);
    final isLoadingTranslation = _loadingTranslations.contains(word.id);
    final translatedDef = _translatedDefinitions[word.id];
    final translatedEx = _translatedExamples[word.id];

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // �ܾ� (ũ�� ���� ���)
              Text(
                word.word,
                style: TextStyle(
                  fontSize: 32 * _wordFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              // 의미 (크고 눈에 띄게)
              if (isLoadingTranslation)
                const CircularProgressIndicator()
              else
                Text(
                  translatedDef ?? '',
                  style: TextStyle(
                    fontSize: 22 * _wordFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 24),
              // ���� ���� (�� ���� ���)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  children: [
                    Text(
                      word.example,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (translatedEx != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        translatedEx,
                        style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 24),
              IconButton(
                onPressed: () => _toggleFavorite(word),
                icon: Icon(
                  word.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: word.isFavorite ? Colors.red : Colors.grey,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'A1':
        return Colors.green;
      case 'A2':
        return Colors.lightGreen;
      case 'B1':
        return Colors.orange;
      case 'B2':
        return Colors.deepOrange;
      case 'C1':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
