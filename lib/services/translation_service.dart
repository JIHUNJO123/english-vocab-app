import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../db/database_helper.dart';

/// 지?�하???�어 목록
class SupportedLanguage {
  final String code; // ?�어 코드 (ko, ja, zh, es, ...)
  final String name; // ?�어 ?�름
  final String nativeName; // 모국???�름

  const SupportedLanguage({
    required this.code,
    required this.name,
    required this.nativeName,
  });
}

/// 번역 ?�비??(무료 API ?�용 + 로컬 캐싱)
class TranslationService {
  static final TranslationService instance = TranslationService._init();
  TranslationService._init();

  // 지???�어 목록
  static const List<SupportedLanguage> supportedLanguages = [
    SupportedLanguage(code: 'en', name: 'English', nativeName: 'English'),
    SupportedLanguage(code: 'ko', name: 'Korean', nativeName: '?�국??),
    SupportedLanguage(code: 'ja', name: 'Japanese', nativeName: '?�本�?),
    SupportedLanguage(code: 'zh', name: 'Chinese', nativeName: '�?��'),
    SupportedLanguage(code: 'es', name: 'Spanish', nativeName: 'Español'),
    SupportedLanguage(code: 'fr', name: 'French', nativeName: 'Français'),
    SupportedLanguage(code: 'de', name: 'German', nativeName: 'Deutsch'),
    SupportedLanguage(code: 'pt', name: 'Portuguese', nativeName: 'Português'),
    SupportedLanguage(code: 'ru', name: 'Russian', nativeName: '????кий'),
    SupportedLanguage(code: 'ar', name: 'Arabic', nativeName: 'ا?عرب?ة'),
    SupportedLanguage(code: 'hi', name: 'Hindi', nativeName: 'हिन्द�?'),
    SupportedLanguage(code: 'bn', name: 'Bengali', nativeName: 'বাংল�?),
    SupportedLanguage(code: 'ur', name: 'Urdu', nativeName: 'ارد?'),
    SupportedLanguage(code: 'fa', name: 'Persian', nativeName: '?ارس?'),
    SupportedLanguage(code: 'th', name: 'Thai', nativeName: 'ไท�?),
    SupportedLanguage(code: 'vi', name: 'Vietnamese', nativeName: 'Tiếng Việt'),
    SupportedLanguage(
      code: 'id',
      name: 'Indonesian',
      nativeName: 'Bahasa Indonesia',
    ),
    SupportedLanguage(code: 'ms', name: 'Malay', nativeName: 'Bahasa Melayu'),
    SupportedLanguage(code: 'tl', name: 'Filipino', nativeName: 'Filipino'),
    SupportedLanguage(code: 'tr', name: 'Turkish', nativeName: 'Türkçe'),
    SupportedLanguage(code: 'uk', name: 'Ukrainian', nativeName: 'Ук?а?н??ка'),
    SupportedLanguage(code: 'pl', name: 'Polish', nativeName: 'Polski'),
    SupportedLanguage(code: 'nl', name: 'Dutch', nativeName: 'Nederlands'),
    SupportedLanguage(code: 'it', name: 'Italian', nativeName: 'Italiano'),
    SupportedLanguage(code: 'sv', name: 'Swedish', nativeName: 'Svenska'),
  ];

  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  /// ?�재 ?�어 ?�보 가?�오�?
  SupportedLanguage get currentLanguageInfo {
    return supportedLanguages.firstWhere(
      (lang) => lang.code == _currentLanguage,
      orElse: () => supportedLanguages.first,
    );
  }

  /// ?�어 ?�정 초기??
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString('nativeLanguage') ?? 'en';
  }

  /// 모국???�정
  Future<void> setLanguage(String languageCode) async {
    _currentLanguage = languageCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nativeLanguage', languageCode);
  }

  /// 번역 ?�요 ?��?
  bool get needsTranslation => _currentLanguage != 'en';

  /// ?�스??번역 (캐시 ?�선)
  Future<String> translate(String text, int wordId, String fieldType) async {
    if (!needsTranslation || text.isEmpty) return text;

    // 1. 캐시 ?�인
    final cached = await DatabaseHelper.instance.getTranslation(
      wordId,
      _currentLanguage,
      fieldType,
    );
    if (cached != null) return cached;

    // 2. API ?�출
    final translated = await _translateWithAPI(text);

    // 3. 캐시 ?�??
    if (translated != text) {
      await DatabaseHelper.instance.saveTranslation(
        wordId,
        _currentLanguage,
        fieldType,
        translated,
      );
    }

    return translated;
  }

  /// MyMemory API�?번역 (무료, ??1000??
  Future<String> _translateWithAPI(String text) async {
    try {
      final url = Uri.parse(
        'https://api.mymemory.translated.net/get'
        '?q=${Uri.encodeComponent(text)}'
        '&langpair=en|$_currentLanguage',
      );

      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final translated = data['responseData']?['translatedText'];
        if (translated != null && translated.toString().isNotEmpty) {
          // MyMemory가 ?�문자�?반환???��? ?�어???�인
          if (translated.toString().toUpperCase() != translated.toString()) {
            return translated.toString();
          }
          return translated.toString();
        }
      }
    } catch (e) {
      print('Translation error: $e');
    }
    return text; // ?�패???�문 반환
  }

  /// 배치 번역 (?�러 ?�어 ?�번??
  Future<void> translateWords(List<int> wordIds) async {
    if (!needsTranslation) return;

    for (final wordId in wordIds) {
      final word = await DatabaseHelper.instance.getWordById(wordId);
      if (word != null) {
        await translate(word.definition, wordId, 'definition');
        await translate(word.example, wordId, 'example');
      }
    }
  }
}
