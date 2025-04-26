import 'dart:async';
import 'package:and_beyond/Home_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Adjust this if your JoinAudioStreamScreen is in another file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  JoinScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Splash.png', fit: BoxFit.fill,
        height: double.infinity,
          width: double.infinity,)
        ,  // Replace with your splash image
      ),
    );
  }
}
