import 'package:flutter/material.dart';
import 'package:meal_ordering/app/auth/controller/register_controller.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/error_massage.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  final Function()? onTap;
  const RegisterView({super.key, required this.onTap});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController _registerController = RegisterController();

  @override
  void dispose() {
    _registerController.dispose();
    super.dispose();
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
                  controller: _registerController.userNameController,
                  hintText: 'User name',
                  obscureText: false,
                  icon: const Icon(Icons.email_outlined),
                ),
                const ErrorMassage(errorText: ""),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _registerController.emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: const Icon(Icons.email_outlined),
                ),
                ErrorMassage(errorText: _registerController.errorEmail),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _registerController.passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock_outline),
                ),
                ErrorMassage(errorText: _registerController.errorPassword),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _registerController.confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock_outline),
                ),
                ErrorMassage(
                    errorText: _registerController.errorConfirmPassword),
                const SizedBox(height: 20),
                AppButton(
                  onTap: _registerController.signUpUser,
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
