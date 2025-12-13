// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?�� آج کا ??ظ';

  @override
  String get learning => 'س?کھ?ا';

  @override
  String get levelLearning => 'سطح ک? ?طاب? س?کھ?ا';

  @override
  String get allWords => 'ت?ا? ا??اظ';

  @override
  String get viewAllWords => 'ت?ا? ا??اظ د?کھ?ں';

  @override
  String get favorites => 'پس?د?د?';

  @override
  String get savedWords => '?ح??ظ ا??اظ';

  @override
  String get flashcard => '???ش کار?';

  @override
  String get cardLearning => 'کار?ز س? س?کھ?ں';

  @override
  String get search => 'ت?اش';

  @override
  String get searchWords => 'ا??اظ ت?اش کر?ں';

  @override
  String get settings => 'ترت?بات';

  @override
  String get noWords => 'ک?ئ? ا??اظ ???ں ???';

  @override
  String get cannotLoadWords => 'ا??اظ ??? ???ں ?? سک?';

  @override
  String get addedToFavorites => 'پس?د?د? ??ں شا??';

  @override
  String get removedFromFavorites => 'پس?د?د? س? ?ٹا د?ا گ?ا';

  @override
  String get definition => '?�� تعر??';

  @override
  String get example => '?�� ?ثا?';

  @override
  String get translating => 'ترج?? ?? ر?ا ??...';

  @override
  String get listenPronunciation => 'ت??ظ س??ں';

  @override
  String get markAsLearned => 'س?کھا ??ا ?شا? ?گائ?ں';

  @override
  String get previous => 'پ?ھ?ا';

  @override
  String get next => 'اگ?ا';

  @override
  String get pronunciation => 'ت??ظ';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => 'پ?ٹ?? ک? ??? ٹ?پ کر?ں';

  @override
  String get levelA1 => 'ابتدائ? ۱';

  @override
  String get levelA2 => 'ابتدائ? ۲';

  @override
  String get levelB1 => 'در??ا?? ۱';

  @override
  String get levelB2 => 'در??ا?? ۲';

  @override
  String get levelC1 => 'ا???ا?س';

  @override
  String levelWords(String level) {
    return '$level ا??اظ';
  }

  @override
  String get flashcardMode => '???ش کار? ???';

  @override
  String get listMode => '??رست ???';

  @override
  String get language => 'زبا?';

  @override
  String get selectLanguage => 'اپ?? زبا? ??تخب کر?ں';

  @override
  String languageChanged(String language) {
    return 'زبا? $language ??ں تبد?? ?? گئ?';
  }

  @override
  String get translationInfo => 'ترج?? ک? ?ع???ات';

  @override
  String get translationInfoDesc => 'ا??اظ د?کھت? ??ت ترج?? خ?د بخ?د ?اؤ? ??? ??ں گ?? آ? ?ائ? استع?ا? ک? ??? ??ا?? ط?ر پر ?ح??ظ ??ں گ??';

  @override
  String get ok => 'ٹھ?ک ??';

  @override
  String get darkMode => '?ارک ???';

  @override
  String get speechRate => 'ب???? ک? ر?تار';

  @override
  String get notifications => 'اط?اعات';

  @override
  String get dailyReminder => 'ر?زا?? ?اد د?ا??';

  @override
  String get about => 'ک? بار? ??ں';

  @override
  String get version => '?ر??';

  @override
  String get developer => '????پر';

  @override
  String get searchHint => 'ا??اظ ت?اش کر?ں...';

  @override
  String get noSearchResults => 'ک?ئ? ?تائج ???ں ???';

  @override
  String get typeToSearch => 'ا??اظ ت?اش کر?? ک? ??? ٹائپ کر?ں';

  @override
  String get noFavorites => 'ابھ? ک?ئ? پس?د?د? ???ں';

  @override
  String get addFavoritesHint => 'د? ک? آئ?ک? پر ٹ?پ کرک? ا??اظ پس?د?د? ??ں شا?? کر?ں';

  @override
  String get posNoun => 'اس?';

  @override
  String get posVerb => '?ع?';

  @override
  String get posAdjective => 'ص?ت';

  @override
  String get posAdverb => '?تع?? ?ع?';

  @override
  String get posPronoun => 'ض??ر';

  @override
  String get posPreposition => 'حر? جار';

  @override
  String get posConjunction => 'حر? عط?';

  @override
  String get posInterjection => 'حر? ?دا';

  @override
  String get posArticle => 'حر? تعر??';

  @override
  String get posDeterminer => '?ع??';

  @override
  String get posAuxiliary => '?ع? ?عا??';

  @override
  String get posPhrasal => '?حا?رات? ?ع?';

  @override
  String get showTranslationFirst => 'پ??? ترج?? دکھائ?ں';

  @override
  String get showTranslationFirstDesc => 'ا?گر?ز? س? پ??? ترج?? شد? ?ع?? دکھائ?ں';

  @override
  String get display => '?سپ??';

  @override
  String get useDarkTheme => '?ارک تھ?? استع?ا? کر?ں';

  @override
  String get restartToApply => 'تھ?? تبد??? ?اگ? کر?? ک? ??? ا?پ د?بار? شر?ع کر?ں';

  @override
  String get learningSection => 'س?کھ?ا';

  @override
  String currentSpeed(String speed) {
    return '??ج?د?: ${speed}x';
  }

  @override
  String get getDailyReminders => 'ر?زا?? س?کھ?? ک? ?اد د?ا??اں حاص? کر?ں';

  @override
  String get copyright => 'کاپ? رائٹ';

  @override
  String get copyrightDesc => 'ت?ا? تعر???ں اص?? ?ا AI س? ت?ار کرد? ??ں';

  @override
  String get copyrightNotice => 'کاپ? رائٹ ??ٹس';

  @override
  String get copyrightContent => 'اس ا?پ ??ں ت?ا? ا??اظ ک? تعر???ں ا?ر ?ثا?? ج??? اص?? ?ا AI س? ت?ار کرد? ??ں?';

  @override
  String get privacyPolicy => 'رازدار? ک? پا??س?';

  @override
  String get privacyContent => '?? ا?پ ک?ئ? ذات? ?ع???ات ج?ع? ذخ?ر? ?ا ش?ئر ???ں کرت??';

  @override
  String get alphabetical => 'حر?? ت?ج?';

  @override
  String get random => 'ب? ترت?ب';

  @override
  String get quiz => 'ک?ئز';

  @override
  String get testYourself => 'خ?د ک? آز?ائ?ں';

  @override
  String get wordQuiz => '??ظ ک?ئز';

  @override
  String quizWithLevel(String level) {
    return '$level ک?ئز';
  }

  @override
  String get wordToMeaningMode => '??ظ?�معن�?;

  @override
  String get meaningToWordMode => '?ع???�لف�?;

  @override
  String get quizComplete => '?�� ک?ئز ?ک??!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% درست';
  }

  @override
  String get exit => 'با?ر ?ک??ں';

  @override
  String get tryAgain => 'د?بار? ک?شش کر?ں';

  @override
  String get quizCompleteMessage => 'ک?ئز ?ک??!';

  @override
  String get excellent => 'ب?تر??! ?��';

  @override
  String get greatJob => 'شاباش! ?��';

  @override
  String get goodStart => 'ا?ھ? شر?عات! ?��';

  @override
  String get keepPracticing => '?ش? جار? رکھ?ں! ?��';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => 'اس ??ظ کا ?ط?ب ک?ا ???';

  @override
  String get whichWordMatches => 'ک?? سا ??ظ اس ?ع?? س? ??تا ???';

  @override
  String get nextQuestion => 'اگ?ا';

  @override
  String get loading => '??? ?? ر?ا ??...';

  @override
  String get removeAds => 'اشت?ارات ?ٹائ?ں';

  @override
  String get removeAdsTitle => 'ت?ا? اشت?ارات ?ٹائ?ں';

  @override
  String get removeAdsDesc => 'اشت?ارات ک? بغ?ر س?کھ?? کا ?ط? اٹھائ?ں';

  @override
  String get adsRemoved => 'اشت?ارات ?ٹا د?? گئ?';

  @override
  String get enjoyAdFree => 'اشت?ارات ک? بغ?ر تجرب? کا ?ط? اٹھائ?ں!';

  @override
  String get restorePurchase => 'خر?دار? بحا? کر?ں';

  @override
  String get restorePurchaseDesc => 'ا?پ د?بار? ا?سٹا? ک? ?ا ???ائس بد??? اشت?ار ?ر? خر?دار? بحا? کر?? ک? ??? ??اں ٹ?پ کر?ں?';

  @override
  String get purchaseFailed => 'خر?دار? ?اکا?? برا? کر? د?بار? ک?شش کر?ں?';

  @override
  String get purchaseRestored => 'خر?دار? کا??اب? س? بحا? ?? گئ?!';

  @override
  String get noPurchaseToRestore => 'بحا? کر?? ک? ??? ک?ئ? خر?دار? ???ں ???';

  @override
  String get buy => 'خر?د?ں';
}
