import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaContact {
  static Future<void> sendEmail(
      String email, String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await launchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      Fluttertoast.showToast(
        msg: 'Could not open the email application.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await launchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      Fluttertoast.showToast(
        msg: 'Could not open the phone application.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  static Future<void> openLocationInMaps() async {
    final Uri mapUrl = Uri.parse('https://maps.app.goo.gl/wdqXHWxPRKSq9K8q8');

    if (await launchUrl(mapUrl)) {
      await launchUrl(mapUrl);
    } else {
      Fluttertoast.showToast(
        msg: 'Could not launch Google Maps.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  static Future<void> openInstagram() async {
    final Uri instagramUrl = Uri.parse('https://instagram.com/frangobaku/');

    if (await launchUrl(instagramUrl)) {
      await launchUrl(instagramUrl);
    } else {
      Fluttertoast.showToast(
        msg: 'Could not launch Instagram.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  static Future<void> openTikTok() async {
    final Uri tiktokUrl = Uri.parse('https://www.tiktok.com/@frangobaku');

    if (await launchUrl(tiktokUrl)) {
      await launchUrl(tiktokUrl);
    } else {
      Fluttertoast.showToast(
        msg: 'Could not launch TikTok.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
