import 'package:flutter/material.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String displayTitle = "";
  final String fullTitle = "Flash Chat Pro";
  int _charIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypewriter();
  }

  void _startTypewriter() {
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (_charIndex < fullTitle.length) {
        setState(() {
          displayTitle += fullTitle[_charIndex];
          _charIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(tag: 'logo', child: Icon(Icons.flash_on, size: 50, color: Colors.amber)),
                Text(displayTitle, style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade400),
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text("Log In", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}