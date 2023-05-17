import 'package:flutter/material.dart';
import 'package:amd_flutter_firebase_auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(children: [
          const SizedBox(height: 150),
          const Icon(
            Icons.feed,
            size: 120,
            color: Colors.white,
          ),
          const SizedBox(height: 48),
          const Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Welcome to New Apps",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(height: 72),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              foregroundColor: const MaterialStatePropertyAll(Colors.pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            child: const Text("LET'S START"),
          )
        ]),
      ),
    );
  }
}
