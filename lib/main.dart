import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hackathon_app/screens/authentication/login/main/login_main.dart';
import 'package:hackathon_app/screens/chatapp/constants/chat_app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure plugin services are initialized
  Gemini.init(apiKey: ChatScreenConstants.GEMINI_API_KEY);
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Make sure this widget is correctly defined
    );
  }
}
