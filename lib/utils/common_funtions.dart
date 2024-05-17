// Function to open YouTube URL
import 'package:url_launcher/url_launcher.dart';

Future<void> launchWebURL({required String url}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
