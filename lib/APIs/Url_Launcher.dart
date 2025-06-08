import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
      return true;
    } else {
      return false;
    }
  }
}
