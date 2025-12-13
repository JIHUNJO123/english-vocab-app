import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';

/// 플랫폼별 TTS 서비스
/// Windows/Linux에서는 TTS를 비활성화하고, iOS/Android/macOS에서만 동작
class TtsService {
  static final TtsService instance = TtsService._init();
  FlutterTts? _flutterTts;
  bool _isSupported = false;

  TtsService._init() {
    _initTts();
  }

  Future<void> _initTts() async {
    // Windows와 Linux에서는 flutter_tts가 복잡한 설정이 필요하므로 비활성화
    if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      _flutterTts = FlutterTts();
      _isSupported = true;
      await _flutterTts!.setLanguage("en-US");
      await _flutterTts!.setSpeechRate(0.5);
      await _flutterTts!.setVolume(1.0);
    } else {
      _isSupported = false;
    }
  }

  bool get isSupported => _isSupported;

  Future<void> speak(String text) async {
    if (_isSupported && _flutterTts != null) {
      await _flutterTts!.speak(text);
    }
  }

  Future<void> stop() async {
    if (_isSupported && _flutterTts != null) {
      await _flutterTts!.stop();
    }
  }

  Future<void> setLanguage(String language) async {
    if (_isSupported && _flutterTts != null) {
      await _flutterTts!.setLanguage(language);
    }
  }

  Future<void> setSpeechRate(double rate) async {
    if (_isSupported && _flutterTts != null) {
      await _flutterTts!.setSpeechRate(rate);
    }
  }

  Future<void> setVolume(double volume) async {
    if (_isSupported && _flutterTts != null) {
      await _flutterTts!.setVolume(volume);
    }
  }
}
