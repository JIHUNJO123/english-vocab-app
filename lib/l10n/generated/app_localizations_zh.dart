// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?“… ä»Šæ—¥?•è¯';

  @override
  String get learning => 'å­¦ä¹ ';

  @override
  String get levelLearning => '?†çº§å­¦ä¹ ';

  @override
  String get allWords => '?¨éƒ¨?•è¯';

  @override
  String get viewAllWords => '?¥çœ‹?€?‰å•è¯?;

  @override
  String get favorites => '?¶è—å¤?;

  @override
  String get savedWords => 'å·²ä¿å­?;

  @override
  String get flashcard => '?ªå¡';

  @override
  String get cardLearning => '?¡ç‰‡å­¦ä¹ ';

  @override
  String get search => '?œç´¢';

  @override
  String get searchWords => '?œç´¢?•è¯';

  @override
  String get settings => 'è®¾ç½®';

  @override
  String get noWords => 'æ²¡æœ‰?•è¯';

  @override
  String get cannotLoadWords => '? æ³•? è½½?•è¯';

  @override
  String get addedToFavorites => 'å·²æ·»? åˆ°?¶è—å¤?;

  @override
  String get removedFromFavorites => 'å·²ä»Ž?¶è—å¤¹ç§»??;

  @override
  String get definition => '?“– ?Šä¹‰';

  @override
  String get example => '?’¬ ä¾‹å¥';

  @override
  String get translating => 'ç¿»è¯‘ä¸?..';

  @override
  String get listenPronunciation => '?¬å‘??;

  @override
  String get markAsLearned => '?‡è?å·²å?';

  @override
  String get previous => 'ä¸Šä?ä¸?;

  @override
  String get next => 'ä¸‹ä?ä¸?;

  @override
  String get pronunciation => '?‘éŸ³';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => '?¹å‡»ç¿»è½¬';

  @override
  String get levelA1 => '?çº§1';

  @override
  String get levelA2 => '?çº§2';

  @override
  String get levelB1 => 'ä¸?º§1';

  @override
  String get levelB2 => 'ä¸?º§2';

  @override
  String get levelC1 => 'é«˜çº§';

  @override
  String levelWords(String level) {
    return '$level ?•è¯';
  }

  @override
  String get flashcardMode => '?ªå¡æ¨¡å¼';

  @override
  String get listMode => '?—è¡¨æ¨¡å¼';

  @override
  String get language => 'è¯??';

  @override
  String get selectLanguage => '?‰æ‹©è¯??';

  @override
  String languageChanged(String language) {
    return 'å·²åˆ‡?¢åˆ°$language';
  }

  @override
  String get translationInfo => 'ç¿»è¯‘è¯´æ˜Ž';

  @override
  String get translationInfoDesc => '?¥çœ‹?•è¯?¶ä¼š?ªåŠ¨ä¸‹è½½ç¿»è¯‘?‚ä¸‹è½½åŽ??¦»çº¿ä½¿?¨ã€?;

  @override
  String get ok => 'ç¡?®š';

  @override
  String get darkMode => 'æ·±è‰²æ¨¡å¼';

  @override
  String get speechRate => '?—è??Ÿåº¦';

  @override
  String get notifications => '?šçŸ¥';

  @override
  String get dailyReminder => 'æ¯æ—¥?é†’';

  @override
  String get about => '?³äºŽ';

  @override
  String get version => '?ˆæœ¬';

  @override
  String get developer => 'å¼€?‘è€?;

  @override
  String get searchHint => '?œç´¢?•è¯...';

  @override
  String get noSearchResults => 'æ²¡æœ‰?¾åˆ°ç»“æžœ';

  @override
  String get typeToSearch => 'è¾“å…¥ä»¥æœç´¢å•è¯?;

  @override
  String get noFavorites => '?‚æ— ?¶è—';

  @override
  String get addFavoritesHint => '?¹å‡»å¿ƒå½¢?¾æ ‡æ·»åŠ ?¶è—';

  @override
  String get posNoun => '?è¯';

  @override
  String get posVerb => '?¨è¯';

  @override
  String get posAdjective => 'å½¢å?è¯?;

  @override
  String get posAdverb => '??¯';

  @override
  String get posPronoun => 'ä»£è¯';

  @override
  String get posPreposition => 'ä»‹è¯';

  @override
  String get posConjunction => 'è¿žè¯';

  @override
  String get posInterjection => '?Ÿå¹è¯?;

  @override
  String get posArticle => '? è¯';

  @override
  String get posDeterminer => '?å®šè¯?;

  @override
  String get posAuxiliary => '?©åŠ¨è¯?;

  @override
  String get posPhrasal => '????¨è¯';

  @override
  String get showTranslationFirst => '?ˆæ˜¾ç¤ºç¿»è¯?;

  @override
  String get showTranslationFirstDesc => '?¨è‹±è¯?¹‹?æ˜¾ç¤ºç¿»è¯‘å«ä¹?;

  @override
  String get display => '?¾ç¤º';

  @override
  String get useDarkTheme => 'ä½¿ç”¨æ·±è‰²ä¸»é¢˜';

  @override
  String get restartToApply => '?å¯åº”ç”¨ä»¥åº”?¨ä¸»é¢˜æ›´??;

  @override
  String get learningSection => 'å­¦ä¹ ';

  @override
  String currentSpeed(String speed) {
    return 'å½“å‰: $speed?é€?;
  }

  @override
  String get getDailyReminders => '?¥æ”¶æ¯æ—¥å­¦ä¹ ?é†’';

  @override
  String get copyright => '?ˆæƒ';

  @override
  String get copyrightDesc => '?€?‰å®šä¹‰å‡ä¸ºåŽŸ?›æˆ–AI?Ÿæˆ';

  @override
  String get copyrightNotice => '?ˆæƒå£°æ˜Ž';

  @override
  String get copyrightContent => 'æ­¤åº”?¨ç¨‹åºä¸­?„æ??‰å•è¯å®šä¹‰å’Œä¾‹å¥?‡ä¸º?Ÿåˆ›?–AI?Ÿæˆ?‚æœªä½¿ç”¨?—ç‰ˆ?ƒä¿?¤çš„è¯å…¸?…å???n\nç¿»è¯‘?±MyMemory APIï¼ˆå…è´¹ç¿»è¯‘æœ?¡ï¼‰?ä¾›??;

  @override
  String get privacyPolicy => '?ç§?¿ç­–';

  @override
  String get privacyContent => 'æ­¤åº”?¨ç¨‹åºä¸?¶é›†?å­˜?¨æˆ–?†äº«ä»»ä½•ä¸ªäººä¿¡æ¯??n\nç¿»è¯‘è¯·æ±‚?‘é€åˆ°MyMemory APIè¿›è¡Œå¤„ç†?‚ç”¨?·æ•°??¸ä¼šå­˜?¨åœ¨å¤–éƒ¨?åŠ¡?¨ä¸Š??;

  @override
  String get alphabetical => 'å­—æ¯é¡ºåº';

  @override
  String get random => '?æœº';

  @override
  String get quiz => 'æµ‹éªŒ';

  @override
  String get testYourself => 'æµ‹è¯•?½åŠ›';

  @override
  String get wordQuiz => '?•è¯æµ‹éªŒ';

  @override
  String quizWithLevel(String level) {
    return '$level æµ‹éªŒ';
  }

  @override
  String get wordToMeaningMode => '?•è¯?’é‡Šä¹?;

  @override
  String get meaningToWordMode => '?Šä¹‰?’å•è¯?;

  @override
  String get quizComplete => '?Ž‰ æµ‹éªŒå®Œæˆï¼?;

  @override
  String correctAnswers(int percentage) {
    return '$percentage% æ­£ç¡®';
  }

  @override
  String get exit => '?€??;

  @override
  String get tryAgain => '?è¯•ä¸€æ¬?;

  @override
  String get quizCompleteMessage => 'æµ‹éªŒå®Œæˆï¼?;

  @override
  String get excellent => 'å¤ªæ£’äº†ï¼ ?ŒŸ';

  @override
  String get greatJob => '?šå¾—å¥½ï¼ ?‘';

  @override
  String get goodStart => 'å¥½çš„å¼€å§‹ï¼ ?’ª';

  @override
  String get keepPracticing => 'ç»§ç»­ç»ƒä¹ ï¼??“š';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => 'è¿™ä¸ª?•è¯?„æ„?æ˜¯ä»€ä¹ˆï¼Ÿ';

  @override
  String get whichWordMatches => '?ªä¸ª?•è¯ç¬?ˆè¿™ä¸ª?æ€ï¼Ÿ';

  @override
  String get nextQuestion => 'ä¸‹ä?é¢?;

  @override
  String get loading => '? è½½ä¸?..';

  @override
  String get removeAds => 'ç§»é™¤å¹¿å‘Š';

  @override
  String get removeAdsTitle => 'ç§»é™¤?€?‰å¹¿??;

  @override
  String get removeAdsDesc => 'äº«å—? å¹¿?Šå?ä¹ ä½“éª?;

  @override
  String get adsRemoved => 'å¹¿å‘Šå·²ç§»??;

  @override
  String get enjoyAdFree => 'äº«å—? å¹¿?Šä½“éªŒï¼';

  @override
  String get restorePurchase => '?¢å¤è´?¹°';

  @override
  String get restorePurchaseDesc => '?æ–°å®‰è£…åº”ç”¨?–æ›´???å¤‡äº†?—ï¼Ÿ?¹å‡»æ­¤å¤„?¢å¤?¨çš„?»å¹¿?Šè´­ä¹°ã€?;

  @override
  String get purchaseFailed => 'è´?¹°å¤±è´¥ï¼Œè??è¯•??;

  @override
  String get purchaseRestored => 'è´?¹°?¢å¤?åŠŸï¼?;

  @override
  String get noPurchaseToRestore => 'æ²¡æœ‰??¢å¤çš„è´?¹°';

  @override
  String get buy => 'è´?¹°';
}
