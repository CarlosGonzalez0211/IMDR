import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/services/auth_service.dart';

import '../../controller/navigation_menu.dart';
import '../../home/blueprint/home_blueprint.dart';

class RoutingOnAuthOperation {
  final AuthService _authService = AuthService();

  void googleSignIn(BuildContext context) async {
    try {
      // Capture the User object returned by the signInWithGoogle method
      User? user = await _authService.signInWithGoogle();
      if (user != null) {
        // Upon successful Google sign-in, navigate to HomeScreen with the User object
        if (!context.mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavigationMenu(user: user)//HomeScreen(user: user)
          ),
        );
      } else {
        // Handle the case where user is null, e.g., sign-in was aborted
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google sign-in was aborted by the user')),
        );
      }
    } catch (error) {
      // Handle errors if sign-in fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google: $error')),
      );
    }
  }

  void emailAuthentication(BuildContext context, String email, String password) async {
    User? user = await _authService.signInWithEmailAndPassword(email, password);
    if (user != null) {
      // Navigate to HomeScreen

      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NavigationMenu(user: user,)//HomeScreen(user: user)
        ),
      );
    } else {
      // Show an error message

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to sign in with email and password')));
    }
  }

  void signUpAuthentication(BuildContext context, String email, String password) async {
    try {
      User? user = await _authService.signUpWithEmailAndPassword(email, password);
      // If the sign-up was successful, navigate to HomeScreen with the User object
      if (user != null) {
        if (!context.mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
              (Route<dynamic> route) => false, // Prevents the user from navigating back
        );
      } else {
        // Handle the case where the user is null if necessary
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to sign up')),
        );
      }
    } catch (e) {
      // If there is an error, display a message to the user
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during sign up: $e')),
      );
    }
  }
}