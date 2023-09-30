import 'package:url_launcher/url_launcher_string.dart';

class ContactController {
  final String whatsappNumber = '+966596331965';
  final String emailAddress = 'ahmad.h.alsaadi@gmail.com';

  Future<void> launchWhatsApp() async {
    final url = 'https://wa.me/$whatsappNumber';
    if (await canLaunchUrlString(url)) {
      await launchWhatsApp();
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  Future<void> sendEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );

    if (await canLaunchUrlString(emailUri.toString())) {
      await launchUrlString(emailUri.toString());
    } else {
      throw 'Could not send email';
    }
  }
}
