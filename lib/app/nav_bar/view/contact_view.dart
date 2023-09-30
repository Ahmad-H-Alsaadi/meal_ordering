import 'package:flutter/material.dart';
import 'package:meal_ordering/app/nav_bar/controller/contact_controller.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = ContactController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: const Color.fromARGB(255, 255, 60, 0), // Red color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: contactController.launchWhatsApp,
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 255, 60, 0), // Red color
              ),
              child: const Text(
                'Contact via WhatsApp',
                style: TextStyle(color: Colors.white), // White text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: contactController.sendEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 255, 60, 0), // Red color
              ),
              child: const Text(
                'Send Email',
                style: TextStyle(color: Colors.white), // White text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
