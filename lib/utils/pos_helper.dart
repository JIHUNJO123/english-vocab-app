import 'package:english_vocab_app/l10n/generated/app_localizations.dart';

/// ?ì–´ ?ˆì‚¬ë¥??„ì¬ ?¸ì–´ë¡?ë²ˆì—­?˜ëŠ” ?¬í¼ ?¨ìˆ˜
String translatePartOfSpeech(AppLocalizations l10n, String pos) {
  final posLower = pos.toLowerCase().trim();

  switch (posLower) {
    case 'noun':
      return l10n.posNoun;
    case 'verb':
      return l10n.posVerb;
    case 'adjective':
      return l10n.posAdjective;
    case 'adverb':
      return l10n.posAdverb;
    case 'pronoun':
      return l10n.posPronoun;
    case 'preposition':
      return l10n.posPreposition;
    case 'conjunction':
      return l10n.posConjunction;
    case 'interjection':
      return l10n.posInterjection;
    case 'article':
      return l10n.posArticle;
    case 'determiner':
      return l10n.posDeterminer;
    case 'auxiliary verb':
    case 'auxiliary':
      return l10n.posAuxiliary;
    case 'phrasal verb':
    case 'phrasal':
      return l10n.posPhrasal;
    default:
      return pos; // ë²ˆì—­???†ìœ¼ë©??ë³¸ ë°˜í™˜
  }
}
