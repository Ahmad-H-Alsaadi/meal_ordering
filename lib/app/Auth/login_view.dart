import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/error_massage.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  final Function()? onTap;
  const LoginView({super.key, required this.onTap});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String errorEmail = '';

  String errorPassword = '';

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          errorEmail = 'Incorrect email';
          errorPassword = '';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorPassword = 'Incorrect password';
          errorEmail = '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                const Icon(
                  Icons.restaurant,
                  size: 100,
                  color: Color.fromARGB(255, 255, 60, 0),
                ),
                const SizedBox(height: 50),
                const Text(
                  "   Welcome to yumealz 🤗",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 50),
                AppTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: const Icon(Icons.email_outlined),
                ),
                ErrorMassage(errorText: errorEmail),
                const SizedBox(height: 10),
                AppTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock_outline),
                ),
                ErrorMassage(errorText: errorPassword),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  onTap: signUserIn,
                  sign: "Sign In",
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Regester Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
