import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_ordering/widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      body: SafeArea(
        child: Center(
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
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
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
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Not a member?"),
                  SizedBox(width: 4),
                  Text(
                    "Regester Now",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
