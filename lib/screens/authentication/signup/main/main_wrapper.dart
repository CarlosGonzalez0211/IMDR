import 'package:flutter/material.dart';

import '../blueprint/sign_up_blueprint.dart';

class MainSignUpScreen extends StatefulWidget {
  const MainSignUpScreen({super.key});

  @override
  State<MainSignUpScreen> createState() => _MainSignUpScreenState();
}

class _MainSignUpScreenState extends State<MainSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const SignUpBlueprint();
  }
}
