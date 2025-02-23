import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pooja_for_everyone/view/Splash_screen.dart';
import 'package:pooja_for_everyone/view/language_translator/languages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storedLocale = GetStorage().read('locale') ?? 'en_US';

    return GetMaterialApp(
      translations: ChangeLanguage(),
      locale: Locale(storedLocale.split('_')[0], storedLocale.split('_')[1]),
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}
