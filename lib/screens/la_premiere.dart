import 'package:flutter/material.dart';
import 'dart:async';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Après 3 secondes, passer à la page suivante
      Navigator.pushReplacementNamed(context, '/logorsign'); 
      // Remplace '/home' par la route de ta prochaine page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.jpg', // Mets ton image ici
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'فْهَمْنِي',
              style: TextStyle(
                fontSize: 32,
                color: Colors.blue,
                fontFamily: 'Cairo', // Mets ici ta police spéciale
              ),
            ),
          ],
        ),
      ),
    );
  }
}