import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/authentication/routing/routing_on_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../login/main/login_main.dart';
import '../../modules/auth_textinputs_module.dart';
import '../../modules/title_text_module.dart';

class SignUpBlueprint extends StatefulWidget {
  const SignUpBlueprint({super.key});

  @override
  State<SignUpBlueprint> createState() => _SignUpBlueprintState();
}

class _SignUpBlueprintState extends State<SignUpBlueprint> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  final RoutingOnAuthOperation _authOperation = RoutingOnAuthOperation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // Using SafeArea
        child: SingleChildScrollView( // Makes the view scrollable
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset(
                  'assets/avatar.png', // Path to your avatar asset image
                  height: 120,
                ),
                const SizedBox(height: 50),
                const TitleText(
                  size: 38,
                  fontWeight: FontWeight.bold,
                  colors: Colors.black,
                  upperText: "Don't have an account?...",
                  text: 'Sign Up!',
                  upperTextSize: 18,
                ),

                const SizedBox(height: 48),
                TextInputModule(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  passwordConfirmController: _passwordConfirmController,// Only for sign-up
                  isSignUp: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  'or',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16.0), // Add spacing between buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Side padding for the button
                  child: SignInButton(
                    Buttons.google,
                    text: "Sign up with Google",
                    onPressed: () {
                      _authOperation.googleSignIn(context);
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: () {
                    navigateTo(context);
                  },
                  child: const Text("Have an account? Sign In!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateTo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(), // Replace with the actual screen widget if different
      ),
    );
  }

}
