import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:projet_signe/screens/Mycours.dart';
import 'package:projet_signe/screens/Quizz.dart';
// ignore: unused_import
import 'package:projet_signe/screens/SettingsScreen.dart';
import 'package:projet_signe/screens/about_us.dart';
import 'package:projet_signe/screens/alphabet_cour.dart';
import 'package:projet_signe/screens/animal.dart';
import 'package:projet_signe/screens/animation.dart';
import 'package:projet_signe/screens/camera.dart';
import 'package:projet_signe/screens/change_password_page.dart';
import 'package:projet_signe/screens/chatboot.dart';
import 'package:projet_signe/screens/couleur.dart';
import 'package:projet_signe/screens/pronouns.dart';
import 'package:projet_signe/screens/days.dart';
import 'package:projet_signe/screens/edit_profile.dart';
import 'package:projet_signe/screens/forget_passwored.dart';
import 'package:projet_signe/screens/fruit.dart';
import 'package:projet_signe/screens/homme_coures.dart';
import 'package:projet_signe/screens/la_premiere.dart';
import 'package:projet_signe/screens/legum.dart';
import 'package:projet_signe/screens/mois.dart';
import 'package:projet_signe/screens/nomber.dart';
import 'package:projet_signe/screens/start_cour.dart';
import 'package:projet_signe/screens/terms_and_conditions.dart';
import 'package:projet_signe/screens/text.dart';
import 'package:projet_signe/screens/verification.dart';
import 'package:projet_signe/screens/voice.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/profile_screen.dart';
import 'screens/Log_in.dart';
import 'screens/sing_up.dart';
import 'screens/first_page.dart';
import 'screens/seconed_page.dart';
import 'screens/select_user.dart';
import 'screens/select.dart';
import 'screens/theme_notifier.dart';
// ignore: unused_import
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: unused_import
import 'generated/l10n.dart';

//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'generated/l10n.dart'; // On le génère ensuite


final ThemeNotifier themeNotifier = ThemeNotifier();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
   try {
    await Supabase.initialize(
      url: 'VOTRE_URL_SUPABASE',
      anonKey: 'VOTRE_CLE_PUBLIQUE_ANON',
    );
    
    // Test de connexion
    await Supabase.instance.client
        .from('sign_videos')
        .select('count')
        .single();
    
  // ignore: empty_catches
  } catch (e) {
  }

  /*await Supabase.initialize(
    url: 'https://rpdvzbdycjhetwfcqhzj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwZHZ6YmR5Y2poZXR3ZmNxaHpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE0NjIwMzksImV4cCI6MjA1NzAzODAzOX0.uLXYVTaRB_D8oWi4ifLjdbucOy8PF5qIsWYfG8ork3g',
  );*/
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ValueListenableBuilder<bool>(
      valueListenable: themeNotifier,
      builder: (context, isDarkMode, _) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.value ? ThemeData.dark() : ThemeData.light(),
        //scaffoldBackgroundColor: AppColors.background,
        locale: const Locale('en'),
        localizationsDelegates:const [
          S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales:S.delegate.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/logorsign': (context) => FirstPage(),
        '/signlog': (context) => SecondPage(),
        '/login': (context) => LogIn(),
        '/signup': (context) => SignUp(),
        '/profilpage':
            (context) =>
                ProfileScreen(username: 'User', email: 'User@gmail.com'),
        '/selectuser': (context) => SelectUserTypeScreen(),
        '/select': (context) => InputModeSelectionScreen(),
        '/voice': (context) => NewRecordingScreen(),
        '/camera': (context) => CameraPage(camera: camera),
        '/animation': (context) => MainScreen(translatedText: 'taxt'),
        '/text': (context) => TranslationScreen(),
        '/start': (context) => WelcomeScreen(),
        '/homme': (context) => HomeScreen(),
        '/coures': (context) => MyCoursesScreen(),
        '/start_page_quizz': (context) => StartPage(),
        '/quizz': (context) => QuizPage(),
        '/parametre': (context) => SettingsScreen(),
        '/about_us': (context) => FhamniHomePage(),
        '/changhe': (context) => ChangePasswordPage(),
        '/terms_and_condition': (context) => TermsAndConditions(),
        '/editprofile': (context) => EditProfile(),
        '/forget': (context) => ForgotPasswordScreen(),
        '/verifier': (context) => VerificationScreen(phoneNumber: '0670898760'),
        '/alpha': (context) => AlphabetCour(),
        '/day': (context) => SignLanguageDays(),
        '/chat': (context) => ChatScreen(),
        '/nomber': (context) => NumbersPage(),
        '/moi': (context) => MonthsPage(),
        '/legume': (context) => VegetablesPage(),
        '/fruite': (context) => FruitsPage(),
        '/animal': (context) => AnimalsPage(),
        '/color': (context) => ColorsPage(),
        '/Pronouns': (context) => PronounsPage(),

      },
    );
  }
     );
}
}







/*{
  "@@locale": "ar",
  "welcome": "مرحبا",
  "startGame": "ابدأ اللعبة",
  "introduction": "مقدمة"
}*/ 