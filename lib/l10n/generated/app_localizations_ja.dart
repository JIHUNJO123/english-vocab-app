// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?“… ä»Šæ—¥??˜èª?;

  @override
  String get learning => 'å­?¿’';

  @override
  String get levelLearning => '?¬ãƒ™?«åˆ¥å­?¿’';

  @override
  String get allWords => '?¨å˜èª?;

  @override
  String get viewAllWords => '?™ã¹?¦ã®?˜èªž?’è¦‹??;

  @override
  String get favorites => '?Šæ°—?«å…¥??;

  @override
  String get savedWords => 'ä¿å­˜?—ãŸ?˜èªž';

  @override
  String get flashcard => '?•ãƒ©?ƒã‚·?¥ã‚«?¼ãƒ‰';

  @override
  String get cardLearning => '?«ãƒ¼?‰ã§å­?¿’';

  @override
  String get search => 'æ¤œç´¢';

  @override
  String get searchWords => '?˜èªž?’æŽ¢??;

  @override
  String get settings => 'è¨?®š';

  @override
  String get noWords => '?˜èªž?Œã‚?Šã¾?›ã‚“';

  @override
  String get cannotLoadWords => '?˜èªž?’èª­?¿è¾¼?ã¾?›ã‚“';

  @override
  String get addedToFavorites => '?Šæ°—?«å…¥?Šã«è¿½åŠ ?—ã¾?—ãŸ';

  @override
  String get removedFromFavorites => '?Šæ°—?«å…¥?Šã‹?‰å‰Š?¤ã—?¾ã—??;

  @override
  String get definition => '?“– ?å‘³';

  @override
  String get example => '?’¬ ä¾‹æ–‡';

  @override
  String get translating => 'ç¿»è¨³ä¸?..';

  @override
  String get listenPronunciation => '?ºéŸ³?’èž??;

  @override
  String get markAsLearned => 'å­?¿’æ¸ˆã¿';

  @override
  String get previous => '?ã¸';

  @override
  String get next => 'æ¬¡ã¸';

  @override
  String get pronunciation => '?ºéŸ³';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => '?¿ãƒƒ?—ã—??£è¿”ã™';

  @override
  String get levelA1 => '?ç´š1';

  @override
  String get levelA2 => '?ç´š2';

  @override
  String get levelB1 => 'ä¸?´š1';

  @override
  String get levelB2 => 'ä¸?´š2';

  @override
  String get levelC1 => 'ä¸Šç´š';

  @override
  String levelWords(String level) {
    return '$level ?˜èªž';
  }

  @override
  String get flashcardMode => '?•ãƒ©?ƒã‚·?¥ã‚«?¼ãƒ‰?¢ãƒ¼??;

  @override
  String get listMode => '?ªã‚¹?ˆãƒ¢?¼ãƒ‰';

  @override
  String get language => 'è¨€èª?;

  @override
  String get selectLanguage => 'è¨€èªžã‚’?¸æŠž';

  @override
  String languageChanged(String language) {
    return '$language?«å¤‰?´ã—?¾ã—??;
  }

  @override
  String get translationInfo => 'ç¿»è¨³?«ã¤?„ã¦';

  @override
  String get translationInfoDesc => '?˜èªž?’è¦‹?‹ã¨?ªå‹•?„ã«ç¿»è¨³?Œã??¦ãƒ³??ƒ¼?‰ã•?Œã¾?™ã€‚ã??¦ãƒ³??ƒ¼?‰ã—?Ÿç¿»è¨³ã¯?ªãƒ•?©ã‚¤?³ã§?‚ä½¿?¨ã§?ã¾?™ã€?;

  @override
  String get ok => 'OK';

  @override
  String get darkMode => '?€?¼ã‚¯?¢ãƒ¼??;

  @override
  String get speechRate => 'èª?¿ä¸Šã’?Ÿåº¦';

  @override
  String get notifications => '?šçŸ¥';

  @override
  String get dailyReminder => 'æ¯Žæ—¥??ƒª?žã‚¤?³ã???;

  @override
  String get about => '?…å ±';

  @override
  String get version => '?ãƒ¼?¸ãƒ§??;

  @override
  String get developer => '?‹ç™º??;

  @override
  String get searchHint => '?˜èªž?’æ¤œç´?..';

  @override
  String get noSearchResults => 'æ¤œç´¢çµæžœ?Œã‚?Šã¾?›ã‚“';

  @override
  String get typeToSearch => '?˜èªž?’æ¤œç´¢ã—?¦ã? ã•??;

  @override
  String get noFavorites => '?Šæ°—?«å…¥?ŠãŒ?‚ã‚Š?¾ã›??;

  @override
  String get addFavoritesHint => '?ãƒ¼?ˆã‚¢?¤ã‚³?³ã‚’?¿ãƒƒ?—ã—?¦ãŠæ°—ã«?¥ã‚Š?«è¿½??;

  @override
  String get posNoun => '?è©ž';

  @override
  String get posVerb => '?•è©ž';

  @override
  String get posAdjective => 'å½¢å?è©?;

  @override
  String get posAdverb => '??©ž';

  @override
  String get posPronoun => 'ä»£åè©?;

  @override
  String get posPreposition => '?ç½®è©?;

  @override
  String get posConjunction => '?¥ç¶šè©?;

  @override
  String get posInterjection => '?“æŠ•è©?;

  @override
  String get posArticle => '? è©ž';

  @override
  String get posDeterminer => '?å®šè©?;

  @override
  String get posAuxiliary => '?©å‹•è©?;

  @override
  String get posPhrasal => '?¥å‹•è©?;

  @override
  String get showTranslationFirst => 'ç¿»è¨³?’å…ˆ?«è¡¨ç¤?;

  @override
  String get showTranslationFirstDesc => '?±èªž??‰?«ç¿»è¨³ã•?ŒãŸ?å‘³?’è¡¨ç¤?;

  @override
  String get display => 'è¡¨ç¤º';

  @override
  String get useDarkTheme => '?€?¼ã‚¯?†ãƒ¼?žã‚’ä½¿ç”¨';

  @override
  String get restartToApply => '?†ãƒ¼?žå¤‰?´ã‚’?©ç”¨?™ã‚‹?«ã¯?¢ãƒ—?ªã‚’?èµ·??;

  @override
  String get learningSection => 'å­?¿’';

  @override
  String currentSpeed(String speed) {
    return '?¾åœ¨: $speed?é€?;
  }

  @override
  String get getDailyReminders => 'æ¯Žæ—¥å­?¿’?ªãƒž?¤ãƒ³?€?¼ã‚’?—ã‘?–ã‚‹';

  @override
  String get copyright => '?—ä½œæ¨?;

  @override
  String get copyrightDesc => '?™ã¹?¦ã®å®šç¾©??‚ª?ªã‚¸?Šãƒ«?¾ãŸ?¯AI?Ÿæˆ';

  @override
  String get copyrightNotice => '?—ä½œæ¨©æƒ…??;

  @override
  String get copyrightContent => '?“ã®?¢ãƒ—?ªã®?™ã¹?¦ã®?˜èªžå®šç¾©?¨ä¾‹?‡ã¯?ªãƒª?¸ãƒŠ?«ã¾?Ÿã¯AI?§ç”Ÿ?ã•?Œã¦?„ã¾?™ã€‚è‘—ä½œæ¨©??‚?‹è¾ž?¸ã‚³?³ãƒ†?³ãƒ„??½¿?¨ã•?Œã¦?„ã¾?›ã‚“??n\nç¿»è¨³?¯MyMemory APIï¼ˆç„¡?™ç¿»è¨³ã‚µ?¼ãƒ“?¹ï¼‰?§æä¾›ã•?Œã¦?„ã¾?™ã€?;

  @override
  String get privacyPolicy => '?—ãƒ©?¤ãƒ?·ãƒ¼?ãƒª?·ãƒ¼';

  @override
  String get privacyContent => '?“ã®?¢ãƒ—?ªã¯?‹äºº?…å ±?’åŽ?†ã€ä¿å­˜ã€å…±?‰ã—?¾ã›?“ã€?n\nç¿»è¨³?ªã‚¯?¨ã‚¹?ˆã¯MyMemory API?«é€ä¿¡?•ã‚Œ??‡¦?†ã•?Œã¾?™ã€‚ãƒ¦?¼ã‚¶?¼ãƒ‡?¼ã‚¿??¤–?¨ã‚µ?¼ãƒ?¼ã«ä¿å­˜?•ã‚Œ?¾ã›?“ã€?;

  @override
  String get alphabetical => '?¢ãƒ«?•ã‚¡?™ãƒƒ?ˆé †';

  @override
  String get random => '?©ãƒ³?€??;

  @override
  String get quiz => '??‚¤??;

  @override
  String get testYourself => 'å®ŸåŠ›?†ã‚¹??;

  @override
  String get wordQuiz => '?˜èªž??‚¤??;

  @override
  String quizWithLevel(String level) {
    return '$level ??‚¤??;
  }

  @override
  String get wordToMeaningMode => '?˜èªž?’æ„??;

  @override
  String get meaningToWordMode => '?å‘³?’å˜èª?;

  @override
  String get quizComplete => '?Ž‰ ??‚¤?ºå®Œäº†ï¼';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% æ­£è§£';
  }

  @override
  String get exit => 'çµ‚äº†';

  @override
  String get tryAgain => '?‚ã†ä¸€åº?;

  @override
  String get quizCompleteMessage => '??‚¤?ºå®Œäº†ï¼';

  @override
  String get excellent => 'å®Œç’§?§ã™ï¼??ŒŸ';

  @override
  String get greatJob => '?ˆã?§ã?¾ã—?Ÿï¼ ?‘';

  @override
  String get goodStart => '?„ã„?¹ã‚¿?¼ãƒˆï¼??’ª';

  @override
  String get keepPracticing => '?‚ã£?¨ç·´ç¿’ã—?ˆã†ï¼??“š';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => '?“ã®?˜èªž??„?³ã¯ä½•ã§?™ã‹ï¼?;

  @override
  String get whichWordMatches => '?“ã®?å‘³?«åˆ?†å˜èªžã¯ï¼?;

  @override
  String get nextQuestion => 'æ¬¡ã¸';

  @override
  String get loading => 'èª?¿è¾¼ã¿ä¸?..';

  @override
  String get removeAds => 'åºƒå‘Š?’å‰Š??;

  @override
  String get removeAdsTitle => '?™ã¹?¦ã®åºƒå‘Š?’å‰Š??;

  @override
  String get removeAdsDesc => 'åºƒå‘Š?ªã—???ç¿’ä½“é¨“ã‚’?Šæ??—ã¿?ã ?•ã„';

  @override
  String get adsRemoved => 'åºƒå‘Š?Œå‰Š?¤ã•?Œã¾?—ãŸ';

  @override
  String get enjoyAdFree => 'åºƒå‘Š?ªã—??½“é¨“ã‚’?Šæ??—ã¿?ã ?•ã„ï¼?;

  @override
  String get restorePurchase => 'è³¼å…¥?’å¾©??;

  @override
  String get restorePurchaseDesc => '?ã‚¤?³ã‚¹?ˆãƒ¼?«ã¾?Ÿã¯æ©Ÿç¨®å¤‰æ›´?—ã¾?—ãŸ?‹ï¼Ÿ?“ã¡?‰ã‚’?¿ãƒƒ?—ã—??ºƒ?Šå‰Š?¤ã®è³¼å…¥?’å¾©?ƒã—?¦ã? ã•?„ã€?;

  @override
  String get purchaseFailed => 'è³¼å…¥?«å¤±?—ã—?¾ã—?Ÿã€‚ã‚‚?†ä?åº¦ãŠè©¦ã—?ã ?•ã„??;

  @override
  String get purchaseRestored => 'è³¼å…¥?Œæ?å¸¸ã«å¾©å…ƒ?•ã‚Œ?¾ã—?Ÿï¼';

  @override
  String get noPurchaseToRestore => 'å¾©å…ƒ?™ã‚‹è³¼å…¥?Œè¦‹?¤ã‹?Šã¾?›ã‚“';

  @override
  String get buy => 'è³¼å…¥';
}
