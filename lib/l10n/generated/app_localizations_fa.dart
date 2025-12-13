// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?�� ک??? ا?ر?ز';

  @override
  String get learning => '?ادگ?ر?';

  @override
  String get levelLearning => '?ادگ?ر? بر اساس سطح';

  @override
  String get allWords => '??? ک??ات';

  @override
  String get viewAllWords => '?شا?د? ??? ک??ات';

  @override
  String get favorites => 'ع?ا???�من�?�‌ه�?;

  @override
  String get savedWords => 'ک??ات ذخ?ر? شد?';

  @override
  String get flashcard => '??ش کارت';

  @override
  String get cardLearning => '?ادگ?ر? با کارت';

  @override
  String get search => 'جستج?';

  @override
  String get searchWords => 'جستج?? ک??ات';

  @override
  String get settings => 'ت?ظ??ات';

  @override
  String get noWords => 'ک????�ا�??ا?ت ?شد';

  @override
  String get cannotLoadWords => 'بارگذار? ک??ات ??ک? ??ست';

  @override
  String get addedToFavorites => 'ب? ع?ا???�من�?�‌ه�?اضا?? شد';

  @override
  String get removedFromFavorites => 'از ع?ا???�من�?�‌ه�?حذ? شد';

  @override
  String get definition => '?�� تعر??';

  @override
  String get example => '?�� ?ثا?';

  @override
  String get translating => 'در حا? ترج??...';

  @override
  String get listenPronunciation => 'گ?ش داد? ب? ت??ظ';

  @override
  String get markAsLearned => 'ع?ا?ت?��?�ار�?ب? ع??ا? ?اد گر?ت? شد?';

  @override
  String get previous => '?ب??';

  @override
  String get next => 'بعد?';

  @override
  String get pronunciation => 'ت??ظ';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => 'برا? برگردا?د? ضرب? بز??د';

  @override
  String get levelA1 => '?بتد? ۱';

  @override
  String get levelA2 => '?بتد? ۲';

  @override
  String get levelB1 => '?ت?سط ۱';

  @override
  String get levelB2 => '?ت?سط ۲';

  @override
  String get levelC1 => 'پ?شر?ت?';

  @override
  String levelWords(String level) {
    return 'ک??ات $level';
  }

  @override
  String get flashcardMode => 'حا?ت ??ش کارت';

  @override
  String get listMode => 'حا?ت ??ست';

  @override
  String get language => 'زبا?';

  @override
  String get selectLanguage => 'زبا? خ?د را ا?تخاب ک??د';

  @override
  String languageChanged(String language) {
    return 'زبا? ب? $language تغ??ر ?ا?ت';
  }

  @override
  String get translationInfo => 'اط?اعات ترج??';

  @override
  String get translationInfoDesc => 'ترج???�ه�???گا? ?شا?د? ک??ات ب? ص?رت خ?دکار دا???د ???�شون�? پس از دا???د? برا? است?اد? آ??ا?? ب? ص?رت ?ح?? ذخ?ر? ???�شون�?';

  @override
  String get ok => 'باش?';

  @override
  String get darkMode => 'حا?ت تار?ک';

  @override
  String get speechRate => 'سرعت گ?تار';

  @override
  String get notifications => 'اع?ا??�ه�?;

  @override
  String get dailyReminder => '?ادآ?ر? ر?زا??';

  @override
  String get about => 'دربار?';

  @override
  String get version => '?سخ?';

  @override
  String get developer => 'ت?سع??��?�ن�??;

  @override
  String get searchHint => 'جستج?? ک??ات...';

  @override
  String get noSearchResults => '?ت?ج??�ا�??ا?ت ?شد';

  @override
  String get typeToSearch => 'برا? جستج?? ک??ات تا?پ ک??د';

  @override
  String get noFavorites => '???ز ع?ا???�من�?�‌ا�???ست';

  @override
  String get addFavoritesHint => 'با ضرب? زد? ر?? آ?ک?? ??ب? ک??ات را ب? ع?ا???�من�?�‌ه�?اضا?? ک??د';

  @override
  String get posNoun => 'اس?';

  @override
  String get posVerb => '?ع?';

  @override
  String get posAdjective => 'ص?ت';

  @override
  String get posAdverb => '??د';

  @override
  String get posPronoun => 'ض??ر';

  @override
  String get posPreposition => 'حر? اضا??';

  @override
  String get posConjunction => 'حر? ربط';

  @override
  String get posInterjection => 'حر? ?دا';

  @override
  String get posArticle => 'حر? تعر??';

  @override
  String get posDeterminer => 'تع????�کنن�??;

  @override
  String get posAuxiliary => '?ع? ک?ک?';

  @override
  String get posPhrasal => '?ع? عبارت?';

  @override
  String get showTranslationFirst => 'ابتدا ترج?? ?شا? داد? ش?د';

  @override
  String get showTranslationFirstDesc => '?ع?? ترج?? شد? را ?ب? از ا?گ??س? ??ا?ش د??د';

  @override
  String get display => '??ا?ش';

  @override
  String get useDarkTheme => 'است?اد? از ت? تار?ک';

  @override
  String get restartToApply => 'برا? اع?ا? تغ??ر ت?? بر?ا?? را ?جددا? را??�ان�?�ز�?ک??د';

  @override
  String get learningSection => '?ادگ?ر?';

  @override
  String currentSpeed(String speed) {
    return '?ع??: ${speed}x';
  }

  @override
  String get getDailyReminders => 'در?ا?ت ?ادآ?ر??�ها�?ر?زا?? ?ادگ?ر?';

  @override
  String get copyright => 'ح? ?شر';

  @override
  String get copyrightDesc => 'ت?ا? تعار?? اص?? ?ا ت???د شد? ت?سط ??ش ?ص??ع? ?ست?د';

  @override
  String get copyrightNotice => 'اع?ا??? ح? ?شر';

  @override
  String get copyrightContent => 'ت?ا? تعار?? ک??ات ? ج??ات ?ثا? در ا?? بر?ا?? اص?? ?ا ت???د شد? ت?سط ??ش ?ص??ع? ?ست?د.';

  @override
  String get privacyPolicy => 'س?است ح?ظ حر?? خص?ص?';

  @override
  String get privacyContent => 'ا?? بر?ا?? ??? اط?اعات شخص? ج?ع?�آوری�?ذخ?ر? ?ا ب? اشتراک ????��?�ار�?';

  @override
  String get alphabetical => 'ا??با??';

  @override
  String get random => 'تصاد??';

  @override
  String get quiz => 'آز???';

  @override
  String get testYourself => 'خ?دتا? را ب?از?ا??د';

  @override
  String get wordQuiz => 'آز??? ک??ات';

  @override
  String quizWithLevel(String level) {
    return 'آز??? $level';
  }

  @override
  String get wordToMeaningMode => 'ک????�معن�?;

  @override
  String get meaningToWordMode => '?ع???�کلم�?;

  @override
  String get quizComplete => '?�� آز??? کا?? شد!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% صح?ح';
  }

  @override
  String get exit => 'خر?ج';

  @override
  String get tryAgain => 'د?بار? ا?تحا? ک??د';

  @override
  String get quizCompleteMessage => 'آز??? کا?? شد!';

  @override
  String get excellent => 'عا??! ?��';

  @override
  String get greatJob => 'آ?ر??! ?��';

  @override
  String get goodStart => 'شر?ع خ?ب! ?��';

  @override
  String get keepPracticing => 'ب? ت?ر?? ادا?? د??د! ?��';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => '?ع?? ا?? ک??? ??ست?';

  @override
  String get whichWordMatches => 'کدا? ک??? با ا?? ?ع?? ?طاب?ت دارد?';

  @override
  String get nextQuestion => 'بعد?';

  @override
  String get loading => 'در حا? بارگذار?...';

  @override
  String get removeAds => 'حذ? تب??غات';

  @override
  String get removeAdsTitle => 'حذ? ??? تب??غات';

  @override
  String get removeAdsDesc => 'از تجرب? ?ادگ?ر? بد?? تب??غات ?ذت ببر?د';

  @override
  String get adsRemoved => 'تب??غات حذ? شد';

  @override
  String get enjoyAdFree => 'از تجرب? بد?? تب??غات خ?د ?ذت ببر?د!';

  @override
  String get restorePurchase => 'باز?اب? خر?د';

  @override
  String get restorePurchaseDesc => 'بر?ا?? را د?بار? ?صب کرد?د ?ا دستگا? تغ??ر داد?د? برا? باز?اب? خر?د بد?? تب??غ ا??جا بز??د.';

  @override
  String get purchaseFailed => 'خر?د ?ا???? ب?د. ?ط?ا? د?بار? ت?اش ک??د.';

  @override
  String get purchaseRestored => 'خر?د با ?????ت باز?اب? شد!';

  @override
  String get noPurchaseToRestore => '??? خر?د? برا? باز?اب? ?ا?ت ?شد';

  @override
  String get buy => 'خر?د';
}
