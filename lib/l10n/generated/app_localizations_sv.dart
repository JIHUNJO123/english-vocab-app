// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?�� Dagens Ord';

  @override
  String get learning => 'Inlärning';

  @override
  String get levelLearning => 'Nivåbaserad Inlärning';

  @override
  String get allWords => 'Alla Ord';

  @override
  String get viewAllWords => 'Visa alla ord';

  @override
  String get favorites => 'Favoriter';

  @override
  String get savedWords => 'Sparade ord';

  @override
  String get flashcard => 'Flashkort';

  @override
  String get cardLearning => 'Lär med kort';

  @override
  String get search => 'Sök';

  @override
  String get searchWords => 'Sök ord';

  @override
  String get settings => 'Inställningar';

  @override
  String get noWords => 'Inga ord hittades';

  @override
  String get cannotLoadWords => 'Kan inte ladda ord';

  @override
  String get addedToFavorites => 'Tillagd i favoriter';

  @override
  String get removedFromFavorites => 'Borttagen från favoriter';

  @override
  String get definition => '?�� Definition';

  @override
  String get example => '?�� Exempel';

  @override
  String get translating => 'Översätter...';

  @override
  String get listenPronunciation => 'Lyssna på uttal';

  @override
  String get markAsLearned => 'Markera som inlärd';

  @override
  String get previous => 'Föregående';

  @override
  String get next => 'Nästa';

  @override
  String get pronunciation => 'Uttal';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => 'Tryck för att vända';

  @override
  String get levelA1 => 'Nybörjare 1';

  @override
  String get levelA2 => 'Nybörjare 2';

  @override
  String get levelB1 => 'Medel 1';

  @override
  String get levelB2 => 'Medel 2';

  @override
  String get levelC1 => 'Avancerad';

  @override
  String levelWords(String level) {
    return '$level Ord';
  }

  @override
  String get flashcardMode => 'Flashkortsläge';

  @override
  String get listMode => 'Listläge';

  @override
  String get language => 'Språk';

  @override
  String get selectLanguage => 'Välj ditt språk';

  @override
  String languageChanged(String language) {
    return 'Språk ändrat till $language';
  }

  @override
  String get translationInfo => 'Översättningsinformation';

  @override
  String get translationInfoDesc => 'Översättningar laddas ner automatiskt när du visar ord. Efter nedladdning sparas de lokalt för offlineanvändning.';

  @override
  String get ok => 'OK';

  @override
  String get darkMode => 'Mörkt läge';

  @override
  String get speechRate => 'Talhastighet';

  @override
  String get notifications => 'Aviseringar';

  @override
  String get dailyReminder => 'Daglig påminnelse';

  @override
  String get about => 'Om';

  @override
  String get version => 'Version';

  @override
  String get developer => 'Utvecklare';

  @override
  String get searchHint => 'Sök efter ord...';

  @override
  String get noSearchResults => 'Inga resultat hittades';

  @override
  String get typeToSearch => 'Skriv för att söka efter ord';

  @override
  String get noFavorites => 'Inga favoriter ännu';

  @override
  String get addFavoritesHint => 'Lägg till ord i favoriter genom att trycka på hjärtikonen';

  @override
  String get posNoun => 'substantiv';

  @override
  String get posVerb => 'verb';

  @override
  String get posAdjective => 'adjektiv';

  @override
  String get posAdverb => 'adverb';

  @override
  String get posPronoun => 'pronomen';

  @override
  String get posPreposition => 'preposition';

  @override
  String get posConjunction => 'konjunktion';

  @override
  String get posInterjection => 'interjektion';

  @override
  String get posArticle => 'artikel';

  @override
  String get posDeterminer => 'determinativ';

  @override
  String get posAuxiliary => 'hjälpverb';

  @override
  String get posPhrasal => 'frasverb';

  @override
  String get showTranslationFirst => 'Visa översättning först';

  @override
  String get showTranslationFirstDesc => 'Visa översatt betydelse före engelska';

  @override
  String get display => 'Visning';

  @override
  String get useDarkTheme => 'Använd mörkt tema';

  @override
  String get restartToApply => 'Starta om appen för att tillämpa temaändring';

  @override
  String get learningSection => 'Inlärning';

  @override
  String currentSpeed(String speed) {
    return 'Nuvarande: ${speed}x';
  }

  @override
  String get getDailyReminders => 'Få dagliga inlärningspåminnelser';

  @override
  String get copyright => 'Upphovsrätt';

  @override
  String get copyrightDesc => 'Alla definitioner är originella eller AI-genererade';

  @override
  String get copyrightNotice => 'Upphovsrättsmeddelande';

  @override
  String get copyrightContent => 'Alla orddefinitioner och exempelmeningar i denna app är originella eller AI-genererade.';

  @override
  String get privacyPolicy => 'Integritetspolicy';

  @override
  String get privacyContent => 'Denna app samlar inte in, lagrar eller delar någon personlig information.';

  @override
  String get alphabetical => 'Alfabetisk';

  @override
  String get random => 'Slumpmässig';

  @override
  String get quiz => 'Quiz';

  @override
  String get testYourself => 'Testa dig själv';

  @override
  String get wordQuiz => 'Ordquiz';

  @override
  String quizWithLevel(String level) {
    return '$level Quiz';
  }

  @override
  String get wordToMeaningMode => 'Ord?�Betydelse';

  @override
  String get meaningToWordMode => 'Betydelse?�Ord';

  @override
  String get quizComplete => '?�� Quiz klar!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% rätt';
  }

  @override
  String get exit => 'Avsluta';

  @override
  String get tryAgain => 'Försök igen';

  @override
  String get quizCompleteMessage => 'Quiz klar!';

  @override
  String get excellent => 'Utmärkt! ?��';

  @override
  String get greatJob => 'Bra jobbat! ?��';

  @override
  String get goodStart => 'Bra start! ?��';

  @override
  String get keepPracticing => 'Fortsätt öva! ?��';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => 'Vad betyder detta ord?';

  @override
  String get whichWordMatches => 'Vilket ord matchar denna betydelse?';

  @override
  String get nextQuestion => 'Nästa';

  @override
  String get loading => 'Laddar...';

  @override
  String get removeAds => 'Ta bort annonser';

  @override
  String get removeAdsTitle => 'Ta bort alla annonser';

  @override
  String get removeAdsDesc => 'Njut av en annonsfri inlärningsupplevelse';

  @override
  String get adsRemoved => 'Annonser borttagna';

  @override
  String get enjoyAdFree => 'Njut av din annonsfria upplevelse!';

  @override
  String get restorePurchase => 'Återställ köp';

  @override
  String get restorePurchaseDesc => 'Ominstallerade appen eller bytte enhet? Tryck här för att återställa ditt reklamfria köp.';

  @override
  String get purchaseFailed => 'Köpet misslyckades. Försök igen.';

  @override
  String get purchaseRestored => 'Köpet har återställts!';

  @override
  String get noPurchaseToRestore => 'Inget köp att återställa';

  @override
  String get buy => 'Köp';
}
