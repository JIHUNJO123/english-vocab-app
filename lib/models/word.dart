/// ?¨ì–´ ëª¨ë¸ (?¤êµ­??ì§€??
/// ?ì–´ ?ë³¸ ?°ì´??+ ?™ì  ë²ˆì—­
class Word {
  final int id;
  final String word;
  final String level;
  final String partOfSpeech;
  final String definition; // ?ì–´ ?•ì˜
  final String example; // ?ì–´ ?ˆë¬¸
  bool isFavorite;

  // ë²ˆì—­???ìŠ¤??(?°í??„ì— ?¤ì •??
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
    this.translatedDefinition,
    this.translatedExample,
  });

  /// JSON?ì„œ ?ì„± (?ì–´ ?ë³¸)
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

  /// DB ë§µì—???ì„±
  factory Word.fromDb(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as int,
      word: json['word'] as String,
      level: json['level'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
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

  /// ë²ˆì—­???•ì˜ ê°€?¸ì˜¤ê¸?(ë²ˆì—­ ?†ìœ¼ë©??ì–´ ?ë³¸)
  String getDefinition(bool useTranslation) {
    if (useTranslation &&
        translatedDefinition != null &&
        translatedDefinition!.isNotEmpty) {
      return translatedDefinition!;
    }
    return definition;
  }

  /// ë²ˆì—­???ˆë¬¸ ê°€?¸ì˜¤ê¸?(ë²ˆì—­ ?†ìœ¼ë©??ì–´ ?ë³¸)
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
