import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';

/// ?Œë«?¼ë³„ TTS ?œë¹„??
/// Windows/Linux?ì„œ??TTSë¥?ë¹„í™œ?±í™”?˜ê³ , iOS/Android/macOS?ì„œë§??™ì‘
class TtsService {
  static final TtsService instance = TtsService._init();
  FlutterTts? _flutterTts;
  bool _isSupported = false;

  TtsService._init() {
    _initTts();
  }

  Future<void> _initTts() async {
    // Windows?€ Linux?ì„œ??flutter_ttsê°€ ë³µì¡???¤ì •???„ìš”?˜ë?ë¡?ë¹„í™œ?±í™”
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
