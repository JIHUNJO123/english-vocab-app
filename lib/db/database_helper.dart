import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/word.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('words.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // 웹에서는 JSON 파싱 방식 사용
    if (kIsWeb) {
      return await openDatabase(path, version: 1, onCreate: _createDBFromJson);
    }

    // 모바일: Pre-built DB 복사 방식
    final exists = await databaseExists(path);
    if (!exists) {
      print('DEBUG: Copying pre-built database from assets...');

      // assets에서 DB 파일 로드
      final data = await rootBundle.load('assets/data/words.db');
      final bytes = data.buffer.asUint8List();

      // 디렉토리 생성
      await Directory(dirname(path)).create(recursive: true);

      // 파일 복사
      await File(path).writeAsBytes(bytes, flush: true);
      print('DEBUG: Database copied successfully');
    }

    return await openDatabase(path, version: 1);
  }

  // 웹용: JSON에서 DB 생성
  Future<void> _createDBFromJson(Database db, int version) async {
    print('DEBUG: Creating database from JSON (web)...');

    await db.execute('''
      CREATE TABLE words (
        id INTEGER PRIMARY KEY,
        word TEXT NOT NULL,
        level TEXT NOT NULL,
        partOfSpeech TEXT NOT NULL,
        definition TEXT NOT NULL,
        example TEXT NOT NULL,
        isFavorite INTEGER DEFAULT 0,
        translations TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE translations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        wordId INTEGER NOT NULL,
        languageCode TEXT NOT NULL,
        fieldType TEXT NOT NULL,
        translatedText TEXT NOT NULL,
        createdAt INTEGER NOT NULL,
        UNIQUE(wordId, languageCode, fieldType)
      )
    ''');

    // JSON 로드 및 삽입
    final String response = await rootBundle.loadString(
      'assets/data/words.json',
    );
    final List<dynamic> data = json.decode(response);

    final batch = db.batch();
    for (var wordJson in data) {
      String? translationsJson;
      if (wordJson['translations'] != null) {
        translationsJson = json.encode(wordJson['translations']);
      }

      batch.insert('words', {
        'id': wordJson['id'] ?? 0,
        'word': wordJson['word'] ?? '',
        'level': wordJson['level'] ?? '',
        'partOfSpeech': wordJson['partOfSpeech'] ?? '',
        'definition': wordJson['definition'] ?? '',
        'example': wordJson['example'] ?? '',
        'isFavorite': 0,
        'translations': translationsJson,
      });
    }
    await batch.commit(noResult: true);
    print('DEBUG: Database created from JSON');
  }

  // ============ 번역 캐시 메서드 ============

  /// 번역 캐시에서 가져오기
  Future<String?> getTranslation(
    int wordId,
    String languageCode,
    String fieldType,
  ) async {
    final db = await instance.database;
    final result = await db.query(
      'translations',
      columns: ['translatedText'],
      where: 'wordId = ? AND languageCode = ? AND fieldType = ?',
      whereArgs: [wordId, languageCode, fieldType],
    );
    if (result.isNotEmpty) {
      return result.first['translatedText'] as String;
    }
    return null;
  }

  /// 번역 캐시에 저장
  Future<void> saveTranslation(
    int wordId,
    String languageCode,
    String fieldType,
    String translatedText,
  ) async {
    final db = await instance.database;
    await db.insert('translations', {
      'wordId': wordId,
      'languageCode': languageCode,
      'fieldType': fieldType,
      'translatedText': translatedText,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Ư�� ����� ��� ���� ����
  Future<void> clearTranslations(String languageCode) async {
    final db = await instance.database;
    await db.delete(
      'translations',
      where: 'languageCode = ?',
      whereArgs: [languageCode],
    );
  }

  /// ��� ���� ĳ�� ����
  Future<void> clearAllTranslations() async {
    final db = await instance.database;
    await db.delete('translations');
  }

  // ============ 단어 메서드 ============

  Future<List<Word>> getAllWords() async {
    final db = await instance.database;
    final result = await db.query('words', orderBy: 'word ASC');
    return result.map((json) => Word.fromDb(json)).toList();
  }

  /// 페이지네이션으로 단어 가져오기
  Future<List<Word>> getWordsPaginated({
    String? level,
    int page = 0,
    int pageSize = 50,
  }) async {
    final db = await instance.database;
    final offset = page * pageSize;

    final result = await db.query(
      'words',
      where: level != null ? 'level = ?' : null,
      whereArgs: level != null ? [level] : null,
      orderBy: 'word ASC',
      limit: pageSize,
      offset: offset,
    );
    return result.map((json) => Word.fromDb(json)).toList();
  }

  /// 전체 단어 수 가져오기
  Future<int> getWordsCount({String? level}) async {
    final db = await instance.database;
    final result = await db.rawQuery(
      level != null
          ? 'SELECT COUNT(*) as count FROM words WHERE level = ?'
          : 'SELECT COUNT(*) as count FROM words',
      level != null ? [level] : null,
    );
    return result.first['count'] as int;
  }

  Future<List<Word>> getWordsByLevel(String level) async {
    final db = await instance.database;
    final result = await db.query(
      'words',
      where: 'level = ?',
      whereArgs: [level],
      orderBy: 'word ASC',
    );
    return result.map((json) => Word.fromDb(json)).toList();
  }

  Future<List<Word>> getFavorites() async {
    final db = await instance.database;
    final result = await db.query(
      'words',
      where: 'isFavorite = ?',
      whereArgs: [1],
      orderBy: 'word ASC',
    );
    return result.map((json) => Word.fromDb(json)).toList();
  }

  Future<List<Word>> searchWords(String query) async {
    final db = await instance.database;
    final result = await db.query(
      'words',
      where: 'word LIKE ? OR definition LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
      orderBy: 'word ASC',
    );
    return result.map((json) => Word.fromDb(json)).toList();
  }

  Future<void> toggleFavorite(int id, bool isFavorite) async {
    final db = await instance.database;
    await db.update(
      'words',
      {'isFavorite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Word?> getWordById(int id) async {
    final db = await instance.database;
    final result = await db.query('words', where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return Word.fromDb(result.first);
  }

  Future<Word?> getRandomWord() async {
    final db = await instance.database;
    final result = await db.rawQuery(
      'SELECT * FROM words ORDER BY RANDOM() LIMIT 1',
    );
    if (result.isEmpty) return null;
    return Word.fromDb(result.first);
  }

  Future<Word?> getTodayWord() async {
    final db = await instance.database;
    // Use date as seed for consistent daily word
    final today = DateTime.now();
    final seed = today.year * 10000 + today.month * 100 + today.day;
    final count =
        Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM words'),
        ) ??
        1;
    final index = seed % count;

    final result = await db.rawQuery('SELECT * FROM words LIMIT 1 OFFSET ?', [
      index,
    ]);
    if (result.isEmpty) return null;
    return Word.fromDb(result.first);
  }

  /// JSON에서 직접 로드하여 오늘의 단어 가져오기 (내장 번역 포함)
  Future<Word?> getTodayWordWithTranslations() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/words.json',
      );
      final List<dynamic> data = json.decode(response);

      if (data.isEmpty) return null;

      // Use date as seed for consistent daily word
      final today = DateTime.now();
      final seed = today.year * 10000 + today.month * 100 + today.day;
      final index = seed % data.length;

      final word = Word.fromJson(data[index]);

      // DB에서 즐겨찾기 상태 가져오기
      try {
        final db = await instance.database;
        final dbResult = await db.query(
          'words',
          columns: ['isFavorite'],
          where: 'id = ?',
          whereArgs: [word.id],
        );

        if (dbResult.isNotEmpty) {
          word.isFavorite = (dbResult.first['isFavorite'] as int) == 1;
        }
      } catch (dbError) {
        print('DB error (ignored): $dbError');
        // DB 오류는 무시하고 JSON에서 로드한 단어 반환
      }

      return word;
    } catch (e) {
      print('Error loading today word: $e');
      return null;
    }
  }

  /// �ܾ ���� ������ ����
  Future<Word> applyTranslations(Word word, String languageCode) async {
    if (languageCode == 'en') return word;

    final translatedDef = await getTranslation(
      word.id,
      languageCode,
      'definition',
    );
    final translatedEx = await getTranslation(word.id, languageCode, 'example');

    return word.copyWith(
      translatedDefinition: translatedDef,
      translatedExample: translatedEx,
    );
  }

  /// ���� �ܾ ���� ����
  Future<List<Word>> applyTranslationsToList(
    List<Word> words,
    String languageCode,
  ) async {
    if (languageCode == 'en') return words;

    final result = <Word>[];
    for (final word in words) {
      result.add(await applyTranslations(word, languageCode));
    }
    return result;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
