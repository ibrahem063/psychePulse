import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/model/network/local/cache_helper.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/users_screen/home_screen/home_layout/home_layout.dart';
import 'package:psychepulse/view/users_screen/splash_screen.dart';
import 'package:psychepulse/view/widget/constanst/constanst.dart';
import 'conf/app_locale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:psychepulse/injection.dart' as di;
import 'firebase_options.dart';
import 'injection.dart';
import 'view/widget/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Bloc observer for debugging
  Bloc.observer = MyBlocObserver();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize CacheHelper
  await CacheHelper.init();

  // Initialize dependency injection
  await di.init();

  // Determine the start widget based on user login status
  Widget startWidget;
  if (uId != null) {
    startWidget = const HomeLayout();
  } else {
    startWidget = const Splash();
  }

  runApp(MyApp(startWidget: startWidget));
}

class MyApp extends StatefulWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();

    // Initialize localization settings
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('ar', AppLocale.AR),
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<psychepulseCubit>()..getUserData()..createDatabase(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'AR'),
        ],
        localizationsDelegates: localization.localizationsDelegates,
        locale: localization.currentLocale,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home:widget.startWidget,
      ),
    );
  }
}

// Global variable to store the current app language
String appLang = 'en';

