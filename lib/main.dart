import 'package:flutter/material.dart';
import 'package:projet_signe/screens/Mycours.dart';
import 'package:projet_signe/screens/Quizz.dart';
// ignore: unused_import
import 'package:projet_signe/screens/SettingsScreen.dart';
import 'package:projet_signe/screens/about_us.dart';
import 'package:projet_signe/screens/alphabet_cour.dart';
import 'package:projet_signe/screens/animation.dart';
import 'package:projet_signe/screens/change_password_page.dart';
import 'package:projet_signe/screens/chatboot.dart';
import 'package:projet_signe/screens/days.dart';
import 'package:projet_signe/screens/edit_profile.dart';
import 'package:projet_signe/screens/forget_passwored.dart';
import 'package:projet_signe/screens/homme_coures.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rpdvzbdycjhetwfcqhzj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwZHZ6YmR5Y2poZXR3ZmNxaHpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE0NjIwMzksImV4cCI6MjA1NzAzODAzOX0.uLXYVTaRB_D8oWi4ifLjdbucOy8PF5qIsWYfG8ork3g',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/signlog': (context) => SecondPage(),
        '/login': (context) => LogIn(),
        '/signup': (context) => SignUp(),
        '/profilpage':
            (context) =>
                ProfileScreen(username: 'belaidi', email: 'zineb@gmail.com'),
        '/selectuser': (context) => SelectUserTypeScreen(),
        '/select': (context) => InputModeSelectionScreen(),
        '/voice': (context) => NewRecordingScreen(),

        '/animation': (context) => MainScreen(translatedText: 'taxt'),
        '/text': (context) => TranslationScreen(),
        '/start': (context) => WelcomeScreen(),
        '/homme': (context) => HomeScreen(),
        '/coures': (context) => MyCoursesScreen(),
        '/start_page_quizz': (context) => StartPage(),
        '/quizz': (context) => QuizPage(),
        '/parametre': (context) => SettingsScreen(),
        '/about_us': (context) => AboutUs(),
        '/changhe': (context) => ChangePasswordPage(),
        '/terms_and_condition': (context) => TermsAndConditions(),
        '/editprofile': (context) => EditProfile(),
        '/forget': (context) => ForgotPasswordScreen(),
        '/verifier': (context) => VerificationScreen(phoneNumber: '0670898760'),
        '/alpha': (context) => AlphabetCour(),
        '/day': (context) => SignLanguageDays(),
        '/chat': (context) => ChatScreen(),
        '/nomber': (context) => NumbersPage(),
      },
    );
  }
}
