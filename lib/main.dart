import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/controller/cubit/cubit.dart';
import 'package:psychepulse/view/screen/home_screen/home_layout.dart';
import 'package:psychepulse/view/screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'conf/app_locale.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('ar', AppLocale.AR)
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'AR'),
      ],
      localizationsDelegates: localization.localizationsDelegates,
      locale: FlutterLocalization.instance.currentLocale,
      theme: ThemeData(
        primaryColor:  Colors.white,
      ),
        debugShowCheckedModeBanner: false,
       home: FirebaseAuth.instance.currentUser==null? Splash():HomeLayout(),

    );
  }
}

String appLang = 'en';