import 'package:url_launcher/url_launcher_string.dart';

class IntentUtils {
  static Future<bool> openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    return await canLaunchUrlString(url) ? await launchUrlString(url) : false;
  }
}
