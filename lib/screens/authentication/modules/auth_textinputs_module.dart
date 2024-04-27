import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routing/routing_on_auth.dart';
import '../widgets/input_text_module.dart';

class TextInputModule extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? passwordConfirmController; // This can be nullable for sign in
  final bool isSignUp;
  final RoutingOnAuthOperation authOperation = RoutingOnAuthOperation();

  TextInputModule({
    super.key,
    required this.emailController,
    required this.isSignUp,
    required this.passwordController,
    this.passwordConfirmController,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      RoundedInputWidget(
        icon: FontAwesomeIcons.envelope,
        hintText: 'Enter your email',
        controller: emailController,
      ),
      const SizedBox(height: 18),
      RoundedInputWidget(
        icon: FontAwesomeIcons.lock,
        hintText: 'Enter your password',
        controller: passwordController,
        isPassword: true,
      ),
    ];

    if (isSignUp && passwordConfirmController != null) { // Ensure the controller is not null
      widgets.addAll([
        const SizedBox(height: 18),
        RoundedInputWidget(
          icon: FontAwesomeIcons.lock,
          hintText: 'Confirm your password',
          controller: passwordConfirmController!, // Now we know it's not null
          isPassword: true,
        ),
      ]);
    }

    widgets.add(const SizedBox(height: 24));
    widgets.add(
      ElevatedButton(
        onPressed: () {
          // For sign up, check that password confirmation matches
          if (isSignUp) {
            if (passwordController.text == passwordConfirmController?.text) {
              authOperation.signUpAuthentication(context, emailController.text, passwordController.text);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Passwords don't match. Please try again")),
              );
            }
          } else {
            // For sign in, simply call the sign in operation
            authOperation.emailAuthentication(context, emailController.text, passwordController.text);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50), // full-width button
        ),
        child: Text(isSignUp ? 'Sign Up' : 'Sign In'),
      ),
    );

    return Column(
      children: widgets,
    );
  }
}
