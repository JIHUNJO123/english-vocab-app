// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?�� Слово дн?';

  @override
  String get learning => '?б??ение';

  @override
  String get levelLearning => '?б??ение по ??овн?м';

  @override
  String get allWords => '??е ?лова';

  @override
  String get viewAllWords => '?оказа?? в?е ?лова';

  @override
  String get favorites => '?зб?анное';

  @override
  String get savedWords => 'Со??аненн?е ?лова';

  @override
  String get flashcard => '?а??о?ки';

  @override
  String get cardLearning => 'У?и???? по ка??о?кам';

  @override
  String get search => '?ои?к';

  @override
  String get searchWords => '?ои?к ?лов';

  @override
  String get settings => '?а???ойки';

  @override
  String get noWords => 'Слова не найден?';

  @override
  String get cannotLoadWords => '?евозможно заг??зи?? ?лова';

  @override
  String get addedToFavorites => '?обавлено в изб?анное';

  @override
  String get removedFromFavorites => 'Удалено из изб?анного';

  @override
  String get definition => '?�� ?п?еделение';

  @override
  String get example => '?�� ??име?';

  @override
  String get translating => '?е?евод...';

  @override
  String get listenPronunciation => '??о?л??а?? п?оизно?ение';

  @override
  String get markAsLearned => '??ме?и?? как из??енное';

  @override
  String get previous => '?азад';

  @override
  String get next => '?алее';

  @override
  String get pronunciation => '??оизно?ение';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => '?ажми?е, ??об? пе?еве?н???';

  @override
  String get levelA1 => '?а?ал?н?й 1';

  @override
  String get levelA2 => '?а?ал?н?й 2';

  @override
  String get levelB1 => 'С?едний 1';

  @override
  String get levelB2 => 'С?едний 2';

  @override
  String get levelC1 => '??одвин???й';

  @override
  String levelWords(String level) {
    return 'Слова $level';
  }

  @override
  String get flashcardMode => '?ежим ка??о?ек';

  @override
  String get listMode => '?ежим ?пи?ка';

  @override
  String get language => 'Яз?к';

  @override
  String get selectLanguage => '??бе?и?е ?з?к';

  @override
  String languageChanged(String language) {
    return 'Яз?к изменен на $language';
  }

  @override
  String get translationInfo => '?н?о?ма?и? о пе?еводе';

  @override
  String get translationInfoDesc => '?е?евод? б?д?? заг??жен? ав?ома?и?е?ки п?и п?о?мо??е ?лов. ?о?ле заг??зки они к??и?????? локал?но дл? о?лайн-и?пол?зовани?.';

  @override
  String get ok => 'OK';

  @override
  String get darkMode => 'Темн?й ?ежим';

  @override
  String get speechRate => 'Ско?о??? ?е?и';

  @override
  String get notifications => 'Уведомлени?';

  @override
  String get dailyReminder => '?жедневное напоминание';

  @override
  String get about => '? п?иложении';

  @override
  String get version => '?е??и?';

  @override
  String get developer => '?аз?або??ик';

  @override
  String get searchHint => '?ои?к ?лов...';

  @override
  String get noSearchResults => '?ез?л??а?? не найден?';

  @override
  String get typeToSearch => '?веди?е дл? пои?ка ?лов';

  @override
  String get noFavorites => '?ока не? изб?анного';

  @override
  String get addFavoritesHint => '?обав??е ?лова в изб?анное, нажав на зна?ок ?е?д?а';

  @override
  String get posNoun => '???е??ви?ел?ное';

  @override
  String get posVerb => 'глагол';

  @override
  String get posAdjective => 'п?илага?ел?ное';

  @override
  String get posAdverb => 'на?е?ие';

  @override
  String get posPronoun => 'ме??оимение';

  @override
  String get posPreposition => 'п?едлог';

  @override
  String get posConjunction => '?о?з';

  @override
  String get posInterjection => 'междоме?ие';

  @override
  String get posArticle => 'а??икл?';

  @override
  String get posDeterminer => 'оп?едели?ел?';

  @override
  String get posAuxiliary => 'в?помога?ел?н?й глагол';

  @override
  String get posPhrasal => '??азов?й глагол';

  @override
  String get showTranslationFirst => '?оказа?? пе?евод пе?в?м';

  @override
  String get showTranslationFirstDesc => '?оказ?ва?? пе?еведенное зна?ение пе?ед англий?ким';

  @override
  String get display => '??об?ажение';

  @override
  String get useDarkTheme => '??пол?зова?? ?емн?? ?ем?';

  @override
  String get restartToApply => '?е?езап???и?е п?иложение дл? п?именени? ?ем?';

  @override
  String get learningSection => '?б??ение';

  @override
  String currentSpeed(String speed) {
    return 'Тек??а?: ${speed}x';
  }

  @override
  String get getDailyReminders => '?ол??а?? ежедневн?е напоминани? об об??ении';

  @override
  String get copyright => '?в?о??кие п?ава';

  @override
  String get copyrightDesc => '??е оп?еделени? о?игинал?н?е или ?оздан? ??';

  @override
  String get copyrightNotice => 'Уведомление об ав?о??ки? п?ава?';

  @override
  String get copyrightContent => '??е оп?еделени? ?лов и п?име?? п?едложений в ??ом п?иложении ?вл????? о?игинал?н?ми или ?оздан? ??. ?он?ен? ?лова?ей, за?и?енн?й ав?о??ким п?авом, не и?пол?з?е???.\n\n?е?евод? п?едо??авлен? MyMemory API (бе?пла?н?й ?е?ви? пе?евода).';

  @override
  String get privacyPolicy => '?оли?ика кон?иден?иал?но??и';

  @override
  String get privacyContent => 'Э?о п?иложение не ?оби?ае?, не ??ани? и не пе?едае? ли?н?? ин?о?ма?и?.\n\n?ап?о?? на пе?евод о?п?авл????? в MyMemory API дл? об?або?ки. ?анн?е пол?зова?елей не ??ан???? на вне?ни? ?е?ве?а?.';

  @override
  String get alphabetical => '?о ал?ави??';

  @override
  String get random => 'Сл??айн?й';

  @override
  String get quiz => 'Те??';

  @override
  String get testYourself => '??ове?? ?еб?';

  @override
  String get wordQuiz => 'Те?? по ?ловам';

  @override
  String quizWithLevel(String level) {
    return 'Те?? $level';
  }

  @override
  String get wordToMeaningMode => 'Слово?�Значени�?;

  @override
  String get meaningToWordMode => '?на?ение?�Слов�?;

  @override
  String get quizComplete => '?�� Те?? заве??ен!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% ??авил?но';
  }

  @override
  String get exit => '???од';

  @override
  String get tryAgain => '?оп?обова?? ?нова';

  @override
  String get quizCompleteMessage => 'Те?? заве??ен!';

  @override
  String get excellent => '??ли?но! ?��';

  @override
  String get greatJob => 'Хо?о?а? ?або?а! ?��';

  @override
  String get goodStart => 'Хо?о?ее на?ало! ?��';

  @override
  String get keepPracticing => '??одолжай?е п?ак?икова????! ?��';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => 'Ч?о озна?ае? ??о ?лово?';

  @override
  String get whichWordMatches => '?акое ?лово ?оо?ве???в?е? ??ом? зна?ени??';

  @override
  String get nextQuestion => '?алее';

  @override
  String get loading => '?аг??зка...';

  @override
  String get removeAds => 'Уб?а?? ?еклам?';

  @override
  String get removeAdsTitle => 'Уб?а?? в?? ?еклам?';

  @override
  String get removeAdsDesc => '?а?лаждай?е?? об??ением без ?еклам?';

  @override
  String get adsRemoved => '?еклама ?далена';

  @override
  String get enjoyAdFree => '?а?лаждай?е?? без ?еклам?!';

  @override
  String get restorePurchase => '?о???анови?? пок?пк?';

  @override
  String get restorePurchaseDesc => '?е?е???ановили п?иложение или ?менили ????ой??во? ?ажми?е зде??, ??об? во???анови?? пок?пк? без ?еклам?.';

  @override
  String get purchaseFailed => '?ок?пка не ?дала??. ?ожал?й??а, поп?об?й?е ?нова.';

  @override
  String get purchaseRestored => '?ок?пка ??пе?но во???ановлена!';

  @override
  String get noPurchaseToRestore => '?е? пок?пок дл? во???ановлени?';

  @override
  String get buy => '??пи??';
}
