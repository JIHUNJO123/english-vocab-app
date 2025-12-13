// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'English Word 10000';

  @override
  String get todayWord => '?“… Kata hari ini';

  @override
  String get learning => 'Belajar';

  @override
  String get levelLearning => 'Per tingkat';

  @override
  String get allWords => 'Semua';

  @override
  String get viewAllWords => 'Lihat semua kata';

  @override
  String get favorites => 'Favorit';

  @override
  String get savedWords => 'Kata tersimpan';

  @override
  String get flashcard => 'Kartu';

  @override
  String get cardLearning => 'Belajar dengan kartu';

  @override
  String get search => 'Cari';

  @override
  String get searchWords => 'Cari kata';

  @override
  String get settings => 'Pengaturan';

  @override
  String get noWords => 'Tidak ada kata';

  @override
  String get cannotLoadWords => 'Tidak bisa memuat';

  @override
  String get addedToFavorites => 'Ditambahkan ke favorit';

  @override
  String get removedFromFavorites => 'Dihapus dari favorit';

  @override
  String get definition => '?“– Arti';

  @override
  String get example => '?’¬ Contoh';

  @override
  String get translating => 'Menerjemahkan...';

  @override
  String get listenPronunciation => 'Dengar';

  @override
  String get markAsLearned => 'Tandai sudah dipelajari';

  @override
  String get previous => 'Sebelum';

  @override
  String get next => 'Berikut';

  @override
  String get pronunciation => 'Ucapkan';

  @override
  String cardCount(int current, int total) {
    return '$current / $total';
  }

  @override
  String get tapToFlip => 'Ketuk untuk membalik';

  @override
  String get levelA1 => 'Pemula 1';

  @override
  String get levelA2 => 'Pemula 2';

  @override
  String get levelB1 => 'Menengah 1';

  @override
  String get levelB2 => 'Menengah 2';

  @override
  String get levelC1 => 'Lanjutan';

  @override
  String levelWords(String level) {
    return 'Kata $level';
  }

  @override
  String get flashcardMode => 'Mode kartu';

  @override
  String get listMode => 'Mode daftar';

  @override
  String get language => 'Bahasa';

  @override
  String get selectLanguage => 'Pilih bahasa';

  @override
  String languageChanged(String language) {
    return 'Diganti ke $language';
  }

  @override
  String get translationInfo => 'Info terjemahan';

  @override
  String get translationInfoDesc => 'Terjemahan akan diunduh otomatis. Setelah diunduh, tersedia offline.';

  @override
  String get ok => 'OK';

  @override
  String get darkMode => 'Mode gelap';

  @override
  String get speechRate => 'Kecepatan';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get dailyReminder => 'Pengingat harian';

  @override
  String get about => 'Tentang';

  @override
  String get version => 'Versi';

  @override
  String get developer => 'Pengembang';

  @override
  String get searchHint => 'Cari kata...';

  @override
  String get noSearchResults => 'Tidak ada hasil';

  @override
  String get typeToSearch => 'Ketik untuk mencari';

  @override
  String get noFavorites => 'Belum ada favorit';

  @override
  String get addFavoritesHint => 'Ketuk hati untuk menambahkan';

  @override
  String get posNoun => 'kata benda';

  @override
  String get posVerb => 'kata kerja';

  @override
  String get posAdjective => 'kata sifat';

  @override
  String get posAdverb => 'kata keterangan';

  @override
  String get posPronoun => 'kata ganti';

  @override
  String get posPreposition => 'kata depan';

  @override
  String get posConjunction => 'kata hubung';

  @override
  String get posInterjection => 'kata seru';

  @override
  String get posArticle => 'kata sandang';

  @override
  String get posDeterminer => 'kata penentu';

  @override
  String get posAuxiliary => 'kata kerja bantu';

  @override
  String get posPhrasal => 'kata kerja frasa';

  @override
  String get showTranslationFirst => 'Tampilkan terjemahan dulu';

  @override
  String get showTranslationFirstDesc => 'Tampilkan arti yang diterjemahkan sebelum bahasa Inggris';

  @override
  String get display => 'Tampilan';

  @override
  String get useDarkTheme => 'Gunakan tema gelap';

  @override
  String get restartToApply => 'Mulai ulang aplikasi untuk menerapkan perubahan tema';

  @override
  String get learningSection => 'Pembelajaran';

  @override
  String currentSpeed(String speed) {
    return 'Saat ini: ${speed}x';
  }

  @override
  String get getDailyReminders => 'Dapatkan pengingat belajar harian';

  @override
  String get copyright => 'Hak cipta';

  @override
  String get copyrightDesc => 'Semua definisi asli atau dibuat oleh AI';

  @override
  String get copyrightNotice => 'Pemberitahuan hak cipta';

  @override
  String get copyrightContent => 'Semua definisi kata dan kalimat contoh dalam aplikasi ini adalah asli atau dibuat oleh AI. Tidak ada konten kamus berhak cipta yang digunakan.\n\nTerjemahan disediakan oleh MyMemory API (layanan terjemahan gratis).';

  @override
  String get privacyPolicy => 'Kebijakan privasi';

  @override
  String get privacyContent => 'Aplikasi ini tidak mengumpulkan, menyimpan, atau membagikan informasi pribadi apa pun.\n\nPermintaan terjemahan dikirim ke MyMemory API untuk diproses. Data pengguna tidak disimpan di server eksternal.';

  @override
  String get alphabetical => 'Abjad';

  @override
  String get random => 'Acak';

  @override
  String get quiz => 'Kuis';

  @override
  String get testYourself => 'Uji dirimu';

  @override
  String get wordQuiz => 'Kuis kosakata';

  @override
  String quizWithLevel(String level) {
    return 'Kuis $level';
  }

  @override
  String get wordToMeaningMode => 'Kata?’Arti';

  @override
  String get meaningToWordMode => 'Arti?’Kata';

  @override
  String get quizComplete => '?Ž‰ Kuis selesai!';

  @override
  String correctAnswers(int percentage) {
    return '$percentage% Benar';
  }

  @override
  String get exit => 'Keluar';

  @override
  String get tryAgain => 'Coba lagi';

  @override
  String get quizCompleteMessage => 'Kuis selesai!';

  @override
  String get excellent => 'Luar biasa! ?ŒŸ';

  @override
  String get greatJob => 'Bagus sekali! ?‘';

  @override
  String get goodStart => 'Awal yang bagus! ?’ª';

  @override
  String get keepPracticing => 'Terus berlatih! ?“š';

  @override
  String questionProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get whatIsTheMeaning => 'Apa arti kata ini?';

  @override
  String get whichWordMatches => 'Kata mana yang cocok dengan arti ini?';

  @override
  String get nextQuestion => 'Berikutnya';

  @override
  String get loading => 'Memuat...';

  @override
  String get removeAds => 'Hapus Iklan';

  @override
  String get removeAdsTitle => 'Hapus Semua Iklan';

  @override
  String get removeAdsDesc => 'Nikmati pengalaman belajar tanpa iklan';

  @override
  String get adsRemoved => 'Iklan Dihapus';

  @override
  String get enjoyAdFree => 'Nikmati pengalaman tanpa iklan!';

  @override
  String get restorePurchase => 'Pulihkan Pembelian';

  @override
  String get restorePurchaseDesc => 'Menginstal ulang aplikasi atau ganti perangkat? Ketuk di sini untuk memulihkan pembelian bebas iklan Anda.';

  @override
  String get purchaseFailed => 'Pembelian gagal. Silakan coba lagi.';

  @override
  String get purchaseRestored => 'Pembelian berhasil dipulihkan!';

  @override
  String get noPurchaseToRestore => 'Tidak ada pembelian untuk dipulihkan';

  @override
  String get buy => 'Beli';
}
