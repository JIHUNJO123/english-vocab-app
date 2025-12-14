/// 단어 모델 (다국어 지원)
/// 영어 원본 데이터 + 동적 번역
class Word {
  final int id;
  final String word;
  final String level;
  final String? partOfSpeech;
  final String definition; // 영어 정의
  final String example; // 영어 예문
  bool isFavorite;

  // 번역된 텍스트 (런타임에 설정됨)
  String? translatedDefinition;
  String? translatedExample;

  Word({
    required this.id,
    required this.word,
    required this.level,
    this.partOfSpeech,
    required this.definition,
    required this.example,
    this.isFavorite = false,
    this.translatedDefinition,
    this.translatedExample,
  });

  /// JSON에서 생성 (영어 원본)
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'],
      word: json['word'],
      level: json['level'],
      partOfSpeech: json['partOfSpeech'],
      definition: json['definition'],
      example: json['example'],
      isFavorite: json['isFavorite'] == 1 || json['isFavorite'] == true,
    );
  }

  /// DB 맵에서 생성
  factory Word.fromDb(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as int,
      word: json['word'] as String,
      level: json['level'] as String,
      partOfSpeech: json['partOfSpeech'] as String?,
      definition: json['definition'] as String,
      example: json['example'] as String,
      isFavorite: (json['isFavorite'] as int) == 1,
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

  /// 번역된 정의 가져오기 (번역 없으면 영어 원본)
  String getDefinition(bool useTranslation) {
    if (useTranslation &&
        translatedDefinition != null &&
        translatedDefinition!.isNotEmpty) {
      return translatedDefinition!;
    }
    return definition;
  }

  /// 번역된 예문 가져오기 (번역 없으면 영어 원본)
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
      translatedDefinition: translatedDefinition ?? this.translatedDefinition,
      translatedExample: translatedExample ?? this.translatedExample,
    );
  }
}
