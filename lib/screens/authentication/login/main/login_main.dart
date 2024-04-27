import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/authentication/login/blueprint/login_blueprint.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBlueprint(),
    );
  }
}
