import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/authentication/routing/routing_on_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../modules/auth_textinputs_module.dart';
import '../../modules/title_text_module.dart';
import '../../signup/main/main_wrapper.dart';

class LoginBlueprint extends StatefulWidget {
  const LoginBlueprint({super.key});

  @override
  State<LoginBlueprint> createState() => _LoginBlueprintState();
}

class _LoginBlueprintState extends State<LoginBlueprint> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  upperText: 'Welcome back...',
                  text: 'Sign In!',
                  upperTextSize: 18,
                ),

                const SizedBox(height: 48),
                TextInputModule(
                  emailController: _emailController,
                  passwordController: _passwordController, // Only for sign-up
                  isSignUp: false,
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
                    navigateToSignup(context);
                  },
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void navigateToSignup(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainSignUpScreen(), // Replace with the actual screen widget if different
      ),
    );
  }
}
