import 'package:url_launcher/url_launcher.dart';

class LauncherUtility {

  static Future<void> makeCall(String phoneNo) async{
    await launchUrl(Uri.parse("tel:$phoneNo"));
  }

  static Future<void> sendSms(String phoneNo) async{
    await launchUrl(Uri.parse("sms:$phoneNo"));
  }
  static Future<void> openUrl(String website) async{
    final Uri _url = Uri.parse(website);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

}