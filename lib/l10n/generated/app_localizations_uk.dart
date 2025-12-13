// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?�� Слово дн?';

  @override
  String get learning => '?ав?анн?';

  @override
  String get levelLearning => '?ав?анн? за ??вн?ми';

  @override
  String get allWords => 'У?? ?лова';

  @override
  String get viewAllWords => '?е?егл?н??и в?? ?лова';

  @override
  String get favorites => '?б?ане';

  @override
  String get savedWords => '?бе?ежен? ?лова';

  @override
  String get flashcard => '?а??ки';

  @override
  String get cardLearning => '??и?и?? з ка??ками';

  @override
  String get search => '?о??к';

  @override
  String get searchWords => 'Ш?ка?и ?лова';

  @override
  String get settings => '?ала???ванн?';

  @override
  String get noWords => 'Сл?в не знайдено';

  @override
  String get cannotLoadWords => '?е вдало?? заван?ажи?и ?лова';

  @override
  String get addedToFavorites => '?одано до об?аного';

  @override
  String get removedFromFavorites => '?идалено з об?аного';

  @override
  String get definition => '?�� ?изна?енн?';

  @override
  String get example => '?�� ??иклад';

  @override
  String get translating => '?е?еклада?мо...';

  @override
  String get listenPronunciation => '??о?л??а?и вимов?';

  @override
  String get markAsLearned => '?озна?и?и ?к вив?ене';

  @override
  String get previous => '?опе?едн?';

  @override
  String get next => '?а???пне';

  @override
  String get pronunciation => '?имова';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => '?а?и?н???, ?об пе?еве?н??и';

  @override
  String get levelA1 => '?о?а?к?ве?? 1';

  @override
  String get levelA2 => '?о?а?к?ве?? 2';

  @override
  String get levelB1 => 'Се?едн?й 1';

  @override
  String get levelB2 => 'Се?едн?й 2';

  @override
  String get levelC1 => '??о??н??ий';

  @override
  String levelWords(String level) {
    return 'Слова $level';
  }

  @override
  String get flashcardMode => '?ежим ка??ок';

  @override
  String get listMode => '?ежим ?пи?к?';

  @override
  String get language => '?ова';

  @override
  String get selectLanguage => '?ибе???? мов?';

  @override
  String languageChanged(String language) {
    return '?ов? зм?нено на $language';
  }

  @override
  String get translationInfo => '?н?о?ма??? п?о пе?еклад';

  @override
  String get translationInfoDesc => '?е?еклади заван?аж?????? ав?ома?и?но п?д ?а? пе?егл?д? ?л?в. ???л? заван?аженн? вони збе??га????? локал?но дл? о?лайн-вико?и??анн?.';

  @override
  String get ok => 'OK';

  @override
  String get darkMode => 'Темний ?ежим';

  @override
  String get speechRate => 'Швидк???? мовленн?';

  @override
  String get notifications => 'Спов??енн?';

  @override
  String get dailyReminder => 'Щоденне нагад?ванн?';

  @override
  String get about => '??о дода?ок';

  @override
  String get version => '?е????';

  @override
  String get developer => '?оз?обник';

  @override
  String get searchHint => 'Ш?ка?и ?лова...';

  @override
  String get noSearchResults => '?ез?л??а??в не знайдено';

  @override
  String get typeToSearch => '?вед??? дл? по??к? ?л?в';

  @override
  String get noFavorites => '?оки ?о нема? об?аного';

  @override
  String get addFavoritesHint => '?одай?е ?лова до об?аного, на?и?н?в?и на ?конк? ?е???';

  @override
  String get posNoun => '?менник';

  @override
  String get posVerb => 'д???лово';

  @override
  String get posAdjective => 'п?икме?ник';

  @override
  String get posAdverb => 'п?и?л?вник';

  @override
  String get posPronoun => 'займенник';

  @override
  String get posPreposition => 'п?ийменник';

  @override
  String get posConjunction => '?пол??ник';

  @override
  String get posInterjection => 'виг?к';

  @override
  String get posArticle => 'а??икл?';

  @override
  String get posDeterminer => 'де?е?м?на?ив';

  @override
  String get posAuxiliary => 'допом?жне д???лово';

  @override
  String get posPhrasal => '??азове д???лово';

  @override
  String get showTranslationFirst => 'Спо?а?к? показа?и пе?еклад';

  @override
  String get showTranslationFirstDesc => '?оказ?ва?и пе?екладене зна?енн? пе?ед англ?й??ким';

  @override
  String get display => '??доб?аженн?';

  @override
  String get useDarkTheme => '?ико?и??ов?ва?и ?емн? ?ем?';

  @override
  String get restartToApply => '?е?езап?????? дода?ок дл? за??о??ванн? зм?ни ?еми';

  @override
  String get learningSection => '?ав?анн?';

  @override
  String currentSpeed(String speed) {
    return '?о?о?на: ${speed}x';
  }

  @override
  String get getDailyReminders => '???им?ва?и ?оденн? нагад?ванн? п?о нав?анн?';

  @override
  String get copyright => '?в?о???ке п?аво';

  @override
  String get copyrightDesc => 'У?? визна?енн? о?иг?нал?н? або згене?ован? Ш?';

  @override
  String get copyrightNotice => '?ов?домленн? п?о ав?о???ке п?аво';

  @override
  String get copyrightContent => 'У?? визна?енн? ?л?в ?а п?иклади ?е?ен? ? ??ом? дода?к? ? о?иг?нал?ними або згене?ованими Ш?.';

  @override
  String get privacyPolicy => '?ол??ика кон??ден??йно???';

  @override
  String get privacyContent => 'Цей дода?ок не зби?а?, не збе??га? ?а не пе?еда? жодно? пе??онал?но? ?н?о?ма???.';

  @override
  String get alphabetical => '?а ал?ав??ом';

  @override
  String get random => '?ипадково';

  @override
  String get quiz => 'Те??';

  @override
  String get testYourself => '?е?ев???е ?ебе';

  @override
  String get wordQuiz => 'Те?? ?л?в';

  @override
  String quizWithLevel(String level) {
    return 'Те?? $level';
  }

  @override
  String get wordToMeaningMode => 'Слово?�Значенн�?;

  @override
  String get meaningToWordMode => '?на?енн??�Слов�?;

  @override
  String get quizComplete => '?�� Те?? заве??ено!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% п?авил?но';
  }

  @override
  String get exit => '?ий?и';

  @override
  String get tryAgain => 'Сп?об?ва?и ?е';

  @override
  String get quizCompleteMessage => 'Те?? заве??ено!';

  @override
  String get excellent => '??дм?нно! ?��';

  @override
  String get greatJob => 'Ч?дово! ?��';

  @override
  String get goodStart => '?а?ний по?а?ок! ?��';

  @override
  String get keepPracticing => '??одовж?й?е п?ак?ик?ва?и??! ?��';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => 'Що озна?а? ?е ?лово?';

  @override
  String get whichWordMatches => 'Яке ?лово в?дпов?да? ??ом? зна?енн??';

  @override
  String get nextQuestion => '?ал?';

  @override
  String get loading => '?аван?аженн?...';

  @override
  String get removeAds => '?идали?и ?еклам?';

  @override
  String get removeAdsTitle => '?идали?и в?? ?еклам?';

  @override
  String get removeAdsDesc => '?а?олодж?й?е?? нав?анн?м без ?еклами';

  @override
  String get adsRemoved => '?еклам? видалено';

  @override
  String get enjoyAdFree => '?а?олодж?й?е?? без ?еклами!';

  @override
  String get restorePurchase => '??днови?и пок?пк?';

  @override
  String get restorePurchaseDesc => '?е?ев??ановили за??о??нок або зм?нили п?и????й? ?а?и?н??? ???, ?об в?днови?и пок?пк? без ?еклами.';

  @override
  String get purchaseFailed => '?ок?пка не вдала??. Сп?об?й?е ?е ?аз.';

  @override
  String get purchaseRestored => '?ок?пк? ??п??но в?дновлено!';

  @override
  String get noPurchaseToRestore => '?ема? пок?пок дл? в?дновленн?';

  @override
  String get buy => '??пи?и';
}
