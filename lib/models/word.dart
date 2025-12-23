import 'dart:convert';

/// 단어 모델 (다국어 지원)
class Word {
  final int id;
  final String word;
  final String level;
  final String partOfSpeech;
  final String definition; // ���� ����
  final String example; // ���� ����
  bool isFavorite;

  // ���� ���� ������ (words.json���� �ε�)
  final Map<String, Map<String, String>>? translations;

  // ������ �ؽ�Ʈ (��Ÿ�ӿ� ������)
  String? translatedDefinition;
  String? translatedExample;

  Word({
    required this.id,
    required this.word,
    required this.level,
    required this.partOfSpeech,
    required this.definition,
    required this.example,
    this.isFavorite = false,
    this.translations,
    this.translatedDefinition,
    this.translatedExample,
  });

  /// 내장 번역 가져오기
  String? getEmbeddedTranslation(String langCode, String fieldType) {
    print(
      'DEBUG getEmbeddedTranslation: word=$word, langCode=$langCode, fieldType=$fieldType',
    );
    print('DEBUG translations is null: ${translations == null}');
    if (translations == null) return null;
    print('DEBUG translations keys: ${translations!.keys.toList()}');
    final langData = translations![langCode];
    print('DEBUG langData: $langData');
    if (langData == null) return null;
    final result = langData[fieldType];
    print('DEBUG result: $result');
    return result;
  }

  /// JSON���� ���� (���� ���� + ���� ����)
  factory Word.fromJson(Map<String, dynamic> json) {
    // translations �Ľ�
    Map<String, Map<String, String>>? translations;
    if (json['translations'] != null) {
      translations = {};
      (json['translations'] as Map<String, dynamic>).forEach((langCode, data) {
        if (data is Map<String, dynamic>) {
          translations![langCode] = {
            'definition': data['definition']?.toString() ?? '',
            'example': data['example']?.toString() ?? '',
          };
        }
      });
    }

    return Word(
      id: json['id'],
      word: json['word'],
      level: json['level'],
      partOfSpeech: json['partOfSpeech'],
      definition: json['definition'],
      example: json['example'],
      isFavorite: json['isFavorite'] == 1 || json['isFavorite'] == true,
      translations: translations,
    );
  }

  /// DB 맵에서 생성 (내장 번역 포함)
  factory Word.fromDb(Map<String, dynamic> json) {
    // translations JSON 문자열 파싱
    Map<String, Map<String, String>>? translations;

    // 첫 단어만 디버그 출력
    if (json['id'] == 1) {
      print('DEBUG fromDb: word=${json['word']}');
      print('DEBUG fromDb: translations raw=${json['translations']}');
      print(
        'DEBUG fromDb: translations type=${json['translations']?.runtimeType}',
      );
    }

    if (json['translations'] != null && json['translations'] is String) {
      try {
        final decoded = jsonDecode(json['translations'] as String);
        if (json['id'] == 1) {
          print('DEBUG fromDb: decoded=$decoded');
        }
        if (decoded is Map<String, dynamic>) {
          translations = {};
          decoded.forEach((langCode, data) {
            if (data is Map<String, dynamic>) {
              translations![langCode] = {
                'definition': data['definition']?.toString() ?? '',
                'example': data['example']?.toString() ?? '',
              };
            }
          });
        }
        if (json['id'] == 1) {
          print('DEBUG fromDb: parsed translations=$translations');
        }
      } catch (e) {
        print('DEBUG fromDb: Error parsing translations: $e');
      }
    }

    return Word(
      id: json['id'] as int,
      word: json['word'] as String,
      level: json['level'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
      definition: json['definition'] as String,
      example: json['example'] as String,
      isFavorite: (json['isFavorite'] as int) == 1,
      translations: translations,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'level': level,
      'partOfSpeech': partOfSpeech,
      'definition': definition,
      'example': example,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  /// ������ ���� �������� (���� ������ ���� ����)
  String getDefinition(bool useTranslation) {
    if (useTranslation &&
        translatedDefinition != null &&
        translatedDefinition!.isNotEmpty) {
      return translatedDefinition!;
    }
    return definition;
  }

  /// ������ ���� �������� (���� ������ ���� ����)
  String getExample(bool useTranslation) {
    if (useTranslation &&
        translatedExample != null &&
        translatedExample!.isNotEmpty) {
      return translatedExample!;
    }
    return example;
  }

  Word copyWith({
    int? id,
    String? word,
    String? level,
    String? partOfSpeech,
    String? definition,
    String? example,
    bool? isFavorite,
    Map<String, Map<String, String>>? translations,
    String? translatedDefinition,
    String? translatedExample,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      level: level ?? this.level,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      isFavorite: isFavorite ?? this.isFavorite,
      translations: translations ?? this.translations,
      translatedDefinition: translatedDefinition ?? this.translatedDefinition,
      translatedExample: translatedExample ?? this.translatedExample,
    );
  }
}
