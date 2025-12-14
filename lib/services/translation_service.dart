import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../db/database_helper.dart';

/// 지원하는 언어 목록
class SupportedLanguage {
  final String code; // 언어 코드 (ko, ja, zh, es, ...)
  final String name; // 영어 이름
  final String nativeName; // 모국어 이름

  const SupportedLanguage({
    required this.code,
    required this.name,
    required this.nativeName,
  });
}

/// 번역 서비스 (무료 API 사용 + 로컬 캐싱)
class TranslationService {
  static final TranslationService instance = TranslationService._init();
  TranslationService._init();

  // 지원 언어 목록
  static const List<SupportedLanguage> supportedLanguages = [
    SupportedLanguage(code: 'en', name: 'English', nativeName: 'English'),
    SupportedLanguage(code: 'ko', name: 'Korean', nativeName: '한국어'),
    SupportedLanguage(code: 'ja', name: 'Japanese', nativeName: '日本語'),
    SupportedLanguage(code: 'zh', name: 'Chinese', nativeName: '中文'),
    SupportedLanguage(code: 'es', name: 'Spanish', nativeName: 'Español'),
    SupportedLanguage(code: 'fr', name: 'French', nativeName: 'Français'),
    SupportedLanguage(code: 'de', name: 'German', nativeName: 'Deutsch'),
    SupportedLanguage(code: 'pt', name: 'Portuguese', nativeName: 'Português'),
    SupportedLanguage(code: 'ru', name: 'Russian', nativeName: 'Русский'),
    SupportedLanguage(code: 'ar', name: 'Arabic', nativeName: 'العربية'),
    SupportedLanguage(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी'),
    SupportedLanguage(code: 'bn', name: 'Bengali', nativeName: 'বাংলা'),
    SupportedLanguage(code: 'ur', name: 'Urdu', nativeName: 'اردو'),
    SupportedLanguage(code: 'fa', name: 'Persian', nativeName: 'فارسی'),
    SupportedLanguage(code: 'th', name: 'Thai', nativeName: 'ไทย'),
    SupportedLanguage(code: 'vi', name: 'Vietnamese', nativeName: 'Tiếng Việt'),
    SupportedLanguage(
      code: 'id',
      name: 'Indonesian',
      nativeName: 'Bahasa Indonesia',
    ),
    SupportedLanguage(code: 'ms', name: 'Malay', nativeName: 'Bahasa Melayu'),
    SupportedLanguage(code: 'tl', name: 'Filipino', nativeName: 'Filipino'),
    SupportedLanguage(code: 'tr', name: 'Turkish', nativeName: 'Türkçe'),
    SupportedLanguage(code: 'uk', name: 'Ukrainian', nativeName: 'Українська'),
    SupportedLanguage(code: 'pl', name: 'Polish', nativeName: 'Polski'),
    SupportedLanguage(code: 'nl', name: 'Dutch', nativeName: 'Nederlands'),
    SupportedLanguage(code: 'it', name: 'Italian', nativeName: 'Italiano'),
    SupportedLanguage(code: 'sv', name: 'Swedish', nativeName: 'Svenska'),
  ];

  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  /// 현재 언어 정보 가져오기
  SupportedLanguage get currentLanguageInfo {
    return supportedLanguages.firstWhere(
      (lang) => lang.code == _currentLanguage,
      orElse: () => supportedLanguages.first,
    );
  }

  /// 언어 설정 초기화
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString('nativeLanguage') ?? 'en';
  }

  /// 모국어 설정
  Future<void> setLanguage(String languageCode) async {
    _currentLanguage = languageCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nativeLanguage', languageCode);
  }

  /// 번역 필요 여부
  bool get needsTranslation => _currentLanguage != 'en';

  /// 텍스트 번역 (캐시 우선)
  Future<String> translate(String text, int wordId, String fieldType) async {
    if (!needsTranslation || text.isEmpty) return text;

    // 1. 캐시 확인
    final cached = await DatabaseHelper.instance.getTranslation(
      wordId,
      _currentLanguage,
      fieldType,
    );
    if (cached != null) return cached;

    // 2. API 호출
    final translated = await _translateWithAPI(text);

    // 3. 캐시 저장
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

  /// MyMemory API로 번역 (무료, 일 1000회)
  Future<String> _translateWithAPI(String text) async {
    try {
      final url = Uri.parse(
        'https://api.mymemory.translated.net/get'
        '?q=${Uri.encodeComponent(text)}'
        '&langpair=en|$_currentLanguage',
      );

      print('Translation API call: en -> $_currentLanguage');
      print(
        '  Text: ${text.substring(0, text.length > 50 ? 50 : text.length)}...',
      );

      final response = await http.get(url).timeout(const Duration(seconds: 10));

      print('  Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final translated = data['responseData']?['translatedText'];
        final status = data['responseStatus'];

        print('  API status: $status');
        print(
          '  Translated: ${translated?.toString().substring(0, (translated?.toString().length ?? 0) > 50 ? 50 : (translated?.toString().length ?? 0))}...',
        );

        if (translated != null && translated.toString().isNotEmpty) {
          // MyMemory가 대문자로 반환할 때가 있어서 확인
          if (translated.toString().toUpperCase() != translated.toString()) {
            return translated.toString();
          }
          return translated.toString();
        }
      }
    } catch (e) {
      print('Translation error: $e');
    }
    print('  Translation failed, returning original text');
    return text; // 실패시 원문 반환
  }

  /// 배치 번역 (여러 단어 한번에)
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
