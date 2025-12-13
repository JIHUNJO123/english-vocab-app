// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?“… ?¤ëŠ˜???¨ì–´';

  @override
  String get learning => '?™ìŠµ?˜ê¸°';

  @override
  String get levelLearning => '?œì´?„ë³„ ?™ìŠµ';

  @override
  String get allWords => '?„ì²´ ?¨ì–´';

  @override
  String get viewAllWords => 'ëª¨ë“  ?¨ì–´ ë³´ê¸°';

  @override
  String get favorites => 'ì¦ê²¨ì°¾ê¸°';

  @override
  String get savedWords => '?€?¥í•œ ?¨ì–´';

  @override
  String get flashcard => '?Œëž˜?œì¹´??;

  @override
  String get cardLearning => 'ì¹´ë“œë¡??™ìŠµ';

  @override
  String get search => 'ê²€??;

  @override
  String get searchWords => '?¨ì–´ ì°¾ê¸°';

  @override
  String get settings => '?¤ì •';

  @override
  String get noWords => '?¨ì–´ê°€ ?†ìŠµ?ˆë‹¤';

  @override
  String get cannotLoadWords => '?¨ì–´ë¥?ë¶ˆëŸ¬?????†ìŠµ?ˆë‹¤';

  @override
  String get addedToFavorites => 'ì¦ê²¨ì°¾ê¸°??ì¶”ê??˜ì—ˆ?µë‹ˆ??;

  @override
  String get removedFromFavorites => 'ì¦ê²¨ì°¾ê¸°?ì„œ ?œê±°?˜ì—ˆ?µë‹ˆ??;

  @override
  String get definition => '?“– ??;

  @override
  String get example => '?’¬ ?ˆë¬¸';

  @override
  String get translating => 'ë²ˆì—­ ì¤?..';

  @override
  String get listenPronunciation => 'ë°œìŒ ?£ê¸°';

  @override
  String get markAsLearned => '?™ìŠµ ?„ë£Œ';

  @override
  String get previous => '?´ì „';

  @override
  String get next => '?¤ìŒ';

  @override
  String get pronunciation => 'ë°œìŒ';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => '??•˜???¤ì§‘ê¸?;

  @override
  String get levelA1 => 'ì´ˆê¸‰ 1';

  @override
  String get levelA2 => 'ì´ˆê¸‰ 2';

  @override
  String get levelB1 => 'ì¤‘ê¸‰ 1';

  @override
  String get levelB2 => 'ì¤‘ê¸‰ 2';

  @override
  String get levelC1 => 'ê³ ê¸‰';

  @override
  String levelWords(String level) {
    return '$level ?¨ì–´';
  }

  @override
  String get flashcardMode => '?Œëž˜?œì¹´??ëª¨ë“œ';

  @override
  String get listMode => 'ë¦¬ìŠ¤??ëª¨ë“œ';

  @override
  String get language => '?¸ì–´';

  @override
  String get selectLanguage => '?¸ì–´ ? íƒ';

  @override
  String languageChanged(String language) {
    return '$languageë¡?ë³€ê²½ë˜?ˆìŠµ?ˆë‹¤';
  }

  @override
  String get translationInfo => 'ë²ˆì—­ ?ˆë‚´';

  @override
  String get translationInfoDesc => '?¨ì–´ë¥?ë³????ë™?¼ë¡œ ë²ˆì—­???¤ìš´ë¡œë“œ?©ë‹ˆ?? ?¤ìš´ë¡œë“œ??ë²ˆì—­?€ ?¤í”„?¼ì¸?ì„œ???¬ìš©?????ˆë„ë¡??€?¥ë©?ˆë‹¤.';

  @override
  String get ok => '?•ì¸';

  @override
  String get darkMode => '?¤í¬ ëª¨ë“œ';

  @override
  String get speechRate => 'ë°œìŒ ?ë„';

  @override
  String get notifications => '?Œë¦¼';

  @override
  String get dailyReminder => 'ë§¤ì¼ ?Œë¦¼';

  @override
  String get about => '?•ë³´';

  @override
  String get version => 'ë²„ì „';

  @override
  String get developer => 'ê°œë°œ??;

  @override
  String get searchHint => '?¨ì–´ë¥?ê²€?‰í•˜?¸ìš”...';

  @override
  String get noSearchResults => 'ê²€??ê²°ê³¼ê°€ ?†ìŠµ?ˆë‹¤';

  @override
  String get typeToSearch => '?¨ì–´ë¥?ê²€?‰í•´ ë³´ì„¸??;

  @override
  String get noFavorites => 'ì¦ê²¨ì°¾ê¸°ê°€ ?†ìŠµ?ˆë‹¤';

  @override
  String get addFavoritesHint => '?˜íŠ¸ ?„ì´ì½˜ì„ ?ŒëŸ¬ ì¦ê²¨ì°¾ê¸°??ì¶”ê??˜ì„¸??;

  @override
  String get posNoun => 'ëª…ì‚¬';

  @override
  String get posVerb => '?™ì‚¬';

  @override
  String get posAdjective => '?•ìš©??;

  @override
  String get posAdverb => 'ë¶€??;

  @override
  String get posPronoun => '?€ëª…ì‚¬';

  @override
  String get posPreposition => '?„ì¹˜??;

  @override
  String get posConjunction => '?‘ì†??;

  @override
  String get posInterjection => 'ê°íƒ„??;

  @override
  String get posArticle => 'ê´€??;

  @override
  String get posDeterminer => '?œì •??;

  @override
  String get posAuxiliary => 'ì¡°ë™??;

  @override
  String get posPhrasal => 'êµ¬ë™??;

  @override
  String get showTranslationFirst => 'ë²ˆì—­ ë¨¼ì? ?œì‹œ';

  @override
  String get showTranslationFirstDesc => '?ì–´ ?„ì— ë²ˆì—­???˜ë?ë¥??œì‹œ?©ë‹ˆ??;

  @override
  String get display => '?”ë©´';

  @override
  String get useDarkTheme => '?´ë‘???Œë§ˆ ?¬ìš©';

  @override
  String get restartToApply => '?Œë§ˆ ë³€ê²½ì„ ?ìš©?˜ë ¤ë©??±ì„ ?¤ì‹œ ?œìž‘?˜ì„¸??;

  @override
  String get learningSection => '?™ìŠµ';

  @override
  String currentSpeed(String speed) {
    return '?„ìž¬: $speedë°°ì†';
  }

  @override
  String get getDailyReminders => 'ë§¤ì¼ ?™ìŠµ ?Œë¦¼ ë°›ê¸°';

  @override
  String get copyright => '?€?‘ê¶Œ';

  @override
  String get copyrightDesc => 'ëª¨ë“  ?•ì˜???¤ë¦¬ì§€???ëŠ” AI ?ì„±?…ë‹ˆ??;

  @override
  String get copyrightNotice => '?€?‘ê¶Œ ?ˆë‚´';

  @override
  String get copyrightContent => '???±ì˜ ëª¨ë“  ?¨ì–´ ?•ì˜?€ ?ˆë¬¸?€ ?¤ë¦¬ì§€?ì´ê±°ë‚˜ AIë¡??ì„±?˜ì—ˆ?µë‹ˆ?? ?€?‘ê¶Œ???ˆëŠ” ?¬ì „ ì½˜í…ì¸ ëŠ” ?¬ìš©?˜ì? ?Šì•˜?µë‹ˆ??\n\në²ˆì—­?€ MyMemory API(ë¬´ë£Œ ë²ˆì—­ ?œë¹„??ë¡??œê³µ?©ë‹ˆ??';

  @override
  String get privacyPolicy => 'ê°œì¸?•ë³´ ì²˜ë¦¬ë°©ì¹¨';

  @override
  String get privacyContent => '???±ì? ê°œì¸ ?•ë³´ë¥??˜ì§‘, ?€???ëŠ” ê³µìœ ?˜ì? ?ŠìŠµ?ˆë‹¤.\n\në²ˆì—­ ?”ì²­?€ MyMemory APIë¡??„ì†¡?˜ì–´ ì²˜ë¦¬?©ë‹ˆ?? ?¬ìš©???°ì´?°ëŠ” ?¸ë? ?œë²„???€?¥ë˜ì§€ ?ŠìŠµ?ˆë‹¤.';

  @override
  String get alphabetical => '?ŒíŒŒë²³ìˆœ';

  @override
  String get random => '?œë¤';

  @override
  String get quiz => '?´ì¦ˆ';

  @override
  String get testYourself => '?¤ë ¥ ?ŒìŠ¤??;

  @override
  String get wordQuiz => '?¨ì–´ ?´ì¦ˆ';

  @override
  String quizWithLevel(String level) {
    return '$level ?´ì¦ˆ';
  }

  @override
  String get wordToMeaningMode => '?¨ì–´?’ëœ»';

  @override
  String get meaningToWordMode => '?»â†’?¨ì–´';

  @override
  String get quizComplete => '?Ž‰ ?´ì¦ˆ ?„ë£Œ!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% ?•ë‹µ';
  }

  @override
  String get exit => 'ì¢…ë£Œ';

  @override
  String get tryAgain => '?¤ì‹œ ?˜ê¸°';

  @override
  String get quizCompleteMessage => '?´ì¦ˆ ?„ë£Œ!';

  @override
  String get excellent => '?„ë²½?´ìš”! ?ŒŸ';

  @override
  String get greatJob => '?˜í–ˆ?´ìš”! ?‘';

  @override
  String get goodStart => 'ì¢‹ì? ?œìž‘?´ì—?? ?’ª';

  @override
  String get keepPracticing => '???°ìŠµ?´ë´?? ?“š';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => '???¨ì–´???»ì? ë¬´ì—‡?¼ê¹Œ??';

  @override
  String get whichWordMatches => '???»ì— ?´ë‹¹?˜ëŠ” ?¨ì–´??';

  @override
  String get nextQuestion => '?¤ìŒ';

  @override
  String get loading => 'ë¡œë”© ì¤?..';

  @override
  String get removeAds => 'ê´‘ê³  ?œê±°';

  @override
  String get removeAdsTitle => 'ëª¨ë“  ê´‘ê³  ?œê±°';

  @override
  String get removeAdsDesc => 'ê´‘ê³  ?†ì´ ?™ìŠµ?˜ì„¸??;

  @override
  String get adsRemoved => 'ê´‘ê³  ?œê±°??;

  @override
  String get enjoyAdFree => 'ê´‘ê³  ?†ì´ ì¦ê¸°?¸ìš”!';

  @override
  String get restorePurchase => 'êµ¬ë§¤ ë³µì›';

  @override
  String get restorePurchaseDesc => '?±ì„ ?¬ì„¤ì¹˜í•˜ê±°ë‚˜ ê¸°ê¸°ë¥?ë³€ê²½í•˜?¨ë‚˜?? ?¬ê¸°ë¥??ŒëŸ¬ ê´‘ê³  ?œê±° êµ¬ë§¤ë¥?ë³µì›?˜ì„¸??';

  @override
  String get purchaseFailed => 'êµ¬ë§¤???¤íŒ¨?ˆìŠµ?ˆë‹¤. ?¤ì‹œ ?œë„?´ì£¼?¸ìš”.';

  @override
  String get purchaseRestored => 'êµ¬ë§¤ê°€ ë³µì›?˜ì—ˆ?µë‹ˆ??';

  @override
  String get noPurchaseToRestore => 'ë³µì›??êµ¬ë§¤ ?´ì—­???†ìŠµ?ˆë‹¤';

  @override
  String get buy => 'êµ¬ë§¤';
}
