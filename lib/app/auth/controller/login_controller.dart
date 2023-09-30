import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorEmail = '';
  String errorPassword = '';

  Future<void> signInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorEmail = 'Incorrect email';
        errorPassword = '';
      } else if (e.code == 'wrong-password') {
        errorPassword = 'Incorrect password';
        errorEmail = '';
      }
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
