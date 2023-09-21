import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/error_massage.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  final Function()? onTap;
  const RegisterView({super.key, required this.onTap});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String errorEmail = '';
  String errorPassword = '';
  String errorConfirmPassword = '';

  void signUserUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        errorConfirmPassword = 'Password don\'t match!';
      }
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
                  size: 50,
                  color: Color.fromARGB(255, 255, 60, 0),
                ),
                const SizedBox(height: 25),
                const Text(
                  "   Lets create an account for you 🔥",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 50),
                AppTextField(
                  controller: userNameController,
                  hintText: 'User name',
                  obscureText: false,
                  icon: const Icon(Icons.email_outlined),
                ),
                ErrorMassage(errorText: errorConfirmPassword),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                AppTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock_outline),
                ),
                ErrorMassage(errorText: errorConfirmPassword),
                const SizedBox(height: 20),
                AppButton(
                  onTap: signUserUp,
                  sign: "Sign Up",
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
