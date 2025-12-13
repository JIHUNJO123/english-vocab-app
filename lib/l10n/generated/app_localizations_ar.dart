// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?�� ???ة ا????';

  @override
  String get learning => 'ا?تع??';

  @override
  String get levelLearning => 'ا?تع?? حسب ا??ست??';

  @override
  String get allWords => '?? ا????ات';

  @override
  String get viewAllWords => 'عرض ج??ع ا????ات';

  @override
  String get favorites => 'ا???ض?ة';

  @override
  String get savedWords => 'ا????ات ا??ح??ظة';

  @override
  String get flashcard => 'بطا?ات تع????ة';

  @override
  String get cardLearning => 'ا?تع?? با?بطا?ات';

  @override
  String get search => 'بحث';

  @override
  String get searchWords => 'ا?بحث ع? ???ات';

  @override
  String get settings => 'ا?إعدادات';

  @override
  String get noWords => '?ا ت?جد ???ات';

  @override
  String get cannotLoadWords => '?ا ???? تح??? ا????ات';

  @override
  String get addedToFavorites => 'ت?ت ا?إضا?ة ????ض?ة';

  @override
  String get removedFromFavorites => 'ت?ت ا?إزا?ة ?? ا???ض?ة';

  @override
  String get definition => '?�� ا?تعر??';

  @override
  String get example => '?�� ?ثا?';

  @override
  String get translating => 'جار? ا?ترج?ة...';

  @override
  String get listenPronunciation => 'است?ع ???ط?';

  @override
  String get markAsLearned => 'ت? ا?تع??';

  @override
  String get previous => 'ا?ساب?';

  @override
  String get next => 'ا?تا??';

  @override
  String get pronunciation => 'ا??ط?';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => 'ا??ر ????ب';

  @override
  String get levelA1 => '?بتدئ 1';

  @override
  String get levelA2 => '?بتدئ 2';

  @override
  String get levelB1 => '?ت?سط 1';

  @override
  String get levelB2 => '?ت?سط 2';

  @override
  String get levelC1 => '?ت?د?';

  @override
  String levelWords(String level) {
    return '???ات $level';
  }

  @override
  String get flashcardMode => '?ضع ا?بطا?ات';

  @override
  String get listMode => '?ضع ا??ائ?ة';

  @override
  String get language => 'ا??غة';

  @override
  String get selectLanguage => 'اختر ?غت?';

  @override
  String languageChanged(String language) {
    return 'ت? تغ??ر ا??غة إ?? $language';
  }

  @override
  String get translationInfo => '?ع???ات ا?ترج?ة';

  @override
  String get translationInfoDesc => 'س?ت? ت?ز?? ا?ترج?ات ت??ائ?ا? ع?د عرض ا????ات. بعد ا?ت?ز??? ?ت? تخز???ا ?ح??ا? ??استخدا? د?? اتصا?.';

  @override
  String get ok => '??ا??';

  @override
  String get darkMode => 'ا??ضع ا?دا??';

  @override
  String get speechRate => 'سرعة ا??ط?';

  @override
  String get notifications => 'ا?إشعارات';

  @override
  String get dailyReminder => 'تذ??ر ????';

  @override
  String get about => 'ح??';

  @override
  String get version => 'ا?إصدار';

  @override
  String get developer => 'ا??ط?ر';

  @override
  String get searchHint => 'ابحث ع? ???ات...';

  @override
  String get noSearchResults => '?ا ت?جد ?تائج';

  @override
  String get typeToSearch => 'ا?تب ??بحث ع? ???ات';

  @override
  String get noFavorites => '?ا ت?جد ??ض?ات بعد';

  @override
  String get addFavoritesHint => 'أض? ???ات ????ض?ة با???ر ع?? أ????ة ا???ب';

  @override
  String get posNoun => 'اس?';

  @override
  String get posVerb => '?ع?';

  @override
  String get posAdjective => 'ص?ة';

  @override
  String get posAdverb => 'ظر?';

  @override
  String get posPronoun => 'ض??ر';

  @override
  String get posPreposition => 'حر? جر';

  @override
  String get posConjunction => 'حر? عط?';

  @override
  String get posInterjection => 'اس? تعجب';

  @override
  String get posArticle => 'أداة تعر??';

  @override
  String get posDeterminer => '?حدد';

  @override
  String get posAuxiliary => '?ع? ?ساعد';

  @override
  String get posPhrasal => '?ع? ?ر?ب';

  @override
  String get showTranslationFirst => 'عرض ا?ترج?ة أ??ا?';

  @override
  String get showTranslationFirstDesc => 'عرض ا??ع?? ا??ترج? ?ب? ا?إ?ج??ز?ة';

  @override
  String get display => 'ا?عرض';

  @override
  String get useDarkTheme => 'استخدا? ا?س?ة ا?دا??ة';

  @override
  String get restartToApply => 'أعد تشغ?? ا?تطب?? ?تطب?? تغ??ر ا?س?ة';

  @override
  String get learningSection => 'ا?تع??';

  @override
  String currentSpeed(String speed) {
    return 'ا?حا??: ${speed}x';
  }

  @override
  String get getDailyReminders => 'احص? ع?? تذ??رات تع?? ????ة';

  @override
  String get copyright => 'ح??? ا??شر';

  @override
  String get copyrightDesc => 'ج??ع ا?تعر??ات أص??ة أ? ???دة با?ذ?اء ا?اصط?اع?';

  @override
  String get copyrightNotice => 'إشعار ح??? ا??شر';

  @override
  String get copyrightContent => 'ج??ع تعر??ات ا????ات ?ا?ج?? ا??ثا? ?? ?ذا ا?تطب?? أص??ة أ? ???دة با?ذ?اء ا?اصط?اع?. ?? ?ت? استخدا? ?حت?? ?ا??س ?ح?? بح??? ا??شر.\n\nا?ترج?ات ??د?ة ?? MyMemory API (خد?ة ترج?ة ?جا??ة).';

  @override
  String get privacyPolicy => 'س?اسة ا?خص?ص?ة';

  @override
  String get privacyContent => '?ذا ا?تطب?? ?ا ?ج?ع أ? ?خز? أ? ?شار? أ? ?ع???ات شخص?ة.\n\n?ت? إرسا? ط?بات ا?ترج?ة إ?? MyMemory API ???عا?جة. ?ا ?ت? تخز?? ب?ا?ات ا??ستخد? ع?? خ?اد? خارج?ة.';

  @override
  String get alphabetical => 'أبجد?';

  @override
  String get random => 'عش?ائ?';

  @override
  String get quiz => 'اختبار';

  @override
  String get testYourself => 'اختبر ??س?';

  @override
  String get wordQuiz => 'اختبار ا????ات';

  @override
  String quizWithLevel(String level) {
    return 'اختبار $level';
  }

  @override
  String get wordToMeaningMode => '???ة?�معن�?;

  @override
  String get meaningToWordMode => '?ع???�كلم�?;

  @override
  String get quizComplete => '?�� ا?ت?? ا?اختبار!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% صح?ح';
  }

  @override
  String get exit => 'خر?ج';

  @override
  String get tryAgain => 'حا?? ?رة أخر?';

  @override
  String get quizCompleteMessage => 'ا?ت?? ا?اختبار!';

  @override
  String get excellent => '??تاز! ?��';

  @override
  String get greatJob => 'ع?? رائع! ?��';

  @override
  String get goodStart => 'بدا?ة ج?دة! ?��';

  @override
  String get keepPracticing => 'است?ر ?? ا?تدر?ب! ?��';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => '?ا ?ع?? ?ذ? ا????ة?';

  @override
  String get whichWordMatches => 'أ? ???ة تتطاب? ?ع ?ذا ا??ع???';

  @override
  String get nextQuestion => 'ا?تا??';

  @override
  String get loading => 'جار ا?تح???...';

  @override
  String get removeAds => 'إزا?ة ا?إع?ا?ات';

  @override
  String get removeAdsTitle => 'إزا?ة ج??ع ا?إع?ا?ات';

  @override
  String get removeAdsDesc => 'است?تع بتجربة تع?? بد?? إع?ا?ات';

  @override
  String get adsRemoved => 'ت?ت إزا?ة ا?إع?ا?ات';

  @override
  String get enjoyAdFree => 'است?تع بتجربت? بد?? إع?ا?ات!';

  @override
  String get restorePurchase => 'استعادة ا??شتر?ات';

  @override
  String get restorePurchaseDesc => 'أعدت تثب?ت ا?تطب?? أ? غ?رت ا?ج?از? اضغط ??ا ?استعادة شراء إزا?ة ا?إع?ا?ات.';

  @override
  String get purchaseFailed => '?ش?ت ع???ة ا?شراء. ?رج? ا??حا??ة ?رة أخر?.';

  @override
  String get purchaseRestored => 'ت?ت استعادة ع???ة ا?شراء ب?جاح!';

  @override
  String get noPurchaseToRestore => '?ا ت?جد ع???ة شراء ??استعادة';

  @override
  String get buy => 'شراء';
}
