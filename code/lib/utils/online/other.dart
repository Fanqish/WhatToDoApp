import 'dart:io';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//Lanuch URL
//Check Internet

void openURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

RxBool internet = true.obs;
void checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      internet.value = true;
    }
  } on SocketException catch (_) {
    internet.value = false;
  }
}
