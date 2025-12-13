import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:english_vocab_app/l10n/generated/app_localizations.dart';
import '../models/word.dart';
import '../services/translation_service.dart';
import '../utils/pos_helper.dart';

class FavoritesFlashcardScreen extends StatefulWidget {
  final List<Word> favorites;

  const FavoritesFlashcardScreen({super.key, required this.favorites});

  @override
  State<FavoritesFlashcardScreen> createState() =>
      _FavoritesFlashcardScreenState();
}

class _FavoritesFlashcardScreenState extends State<FavoritesFlashcardScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _showAnswer = false;
  final FlutterTts _flutterTts = FlutterTts();
  late List<Word> _shuffledFavorites;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  // 번역 관??
  String? _translatedDefinition;
  String? _translatedExample;
  bool _isLoadingTranslation = false;

  @override
  void initState() {
    super.initState();
    _shuffledFavorites = List.from(widget.favorites)..shuffle();
    _initTts();
    _initAnimation();
    _loadTranslation();
  }

  void _initAnimation() {
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
  }

  Future<void> _loadTranslation() async {
    if (_shuffledFavorites.isEmpty) return;

    final word = _shuffledFavorites[_currentIndex];
    final translationService = TranslationService.instance;
    await translationService.init();

    if (translationService.needsTranslation) {
      setState(() => _isLoadingTranslation = true);

      final translatedDef = await translationService.translate(
        word.definition,
        word.id,
        'definition',
      );
      final translatedEx = await translationService.translate(
        word.example,
        word.id,
        'example',
      );

      setState(() {
        _translatedDefinition = translatedDef;
        _translatedExample = translatedEx;
        _isLoadingTranslation = false;
      });
    } else {
      setState(() {
        _translatedDefinition = null;
        _translatedExample = null;
      });
    }
  }

  Future<void> _speak(String text) async {
    await _flutterTts.speak(text);
  }

  void _flipCard() {
    if (_showAnswer) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  void _nextCard() {
    if (_currentIndex < _shuffledFavorites.length - 1) {
      setState(() {
        _currentIndex++;
        _showAnswer = false;
        _translatedDefinition = null;
        _translatedExample = null;
      });
      _flipController.reset();
      _loadTranslation();
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _showAnswer = false;
        _translatedDefinition = null;
        _translatedExample = null;
      });
      _flipController.reset();
      _loadTranslation();
    }
  }

  void _shuffleCards() {
    setState(() {
      _shuffledFavorites.shuffle();
      _currentIndex = 0;
      _showAnswer = false;
      _translatedDefinition = null;
      _translatedExample = null;
    });
    _flipController.reset();
    _loadTranslation();
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_shuffledFavorites.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.flashcard)),
        body: Center(child: Text(l10n.noFavorites)),
      );
    }

    final word = _shuffledFavorites[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.flashcard),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            tooltip: '?�기',
            onPressed: _shuffleCards,
          ),
        ],
      ),
      body: Column(
        children: [
          // 진행 ?�시
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '${_currentIndex + 1} / ${_shuffledFavorites.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (_currentIndex + 1) / _shuffledFavorites.length,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),

          // ?�래?�카??
          Expanded(
            child: GestureDetector(
              onTap: _flipCard,
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity != null) {
                  if (details.primaryVelocity! < -200) {
                    _nextCard();
                  } else if (details.primaryVelocity! > 200) {
                    _previousCard();
                  }
                }
              },
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final angle = _flipAnimation.value * 3.14159;
                  final isBack = _flipAnimation.value > 0.5;

                  return Transform(
                    transform:
                        Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(angle),
                    alignment: Alignment.center,
                    child:
                        isBack
                            ? Transform(
                              transform: Matrix4.identity()..rotateY(3.14159),
                              alignment: Alignment.center,
                              child: _buildBackCard(word, l10n),
                            )
                            : _buildFrontCard(word, l10n),
                  );
                },
              ),
            ),
          ),

          // ?�비게이??버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentIndex > 0 ? _previousCard : null,
                  icon: const Icon(Icons.arrow_back),
                  label: Text(l10n.previous),
                ),
                ElevatedButton.icon(
                  onPressed: _flipCard,
                  icon: Icon(
                    _showAnswer ? Icons.flip_to_front : Icons.flip_to_back,
                  ),
                  label: Text(_showAnswer ? '?�면' : '?�집�?),
                ),
                ElevatedButton.icon(
                  onPressed:
                      _currentIndex < _shuffledFavorites.length - 1
                          ? _nextCard
                          : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(l10n.next),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontCard(Word word, AppLocalizations l10n) {
    // ?�면: ?�어 ?�어 보여주기 (?�어 보고 ??맞추�?
    return _buildCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word.word,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          IconButton(
            icon: const Icon(Icons.volume_up, size: 32),
            onPressed: () => _speak(word.word),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getLevelColor(word.level).withAlpha(50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              word.level,
              style: TextStyle(
                color: _getLevelColor(word.level),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.tapToFlip,
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard(Word word, AppLocalizations l10n) {
    // ?�면: 번역???�과 ?�문
    return _buildCard(
      color: Colors.blue[50],
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word.word,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              translatePartOfSpeech(l10n, word.partOfSpeech),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            if (_isLoadingTranslation)
              const CircularProgressIndicator()
            else ...[
              Text(
                _translatedDefinition ?? word.definition,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      word.example,
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (_translatedExample != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _translatedExample!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child, Color? color}) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(child: child),
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
