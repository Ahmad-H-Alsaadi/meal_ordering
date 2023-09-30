import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String errorEmail = '';
  String errorPassword = '';
  String errorConfirmPassword = '';

  Future<void> signUpUser() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        errorConfirmPassword = 'Password doesn\'t match!';
      }
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
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
