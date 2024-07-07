import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import '/core/consts/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class LunchHelper {
  const LunchHelper._();
  static Future<void> launchMapDirections({
    required LatLng? endPostion,
    required LatLng? originLPostion,
  }) async {
    String url;

    url =
        'https://www.google.com/maps/dir/?api=1&origin=${originLPostion?.latitude},${originLPostion?.longitude}&destination=${endPostion?.latitude},${endPostion?.longitude}&travelmode=driving';

    await launchURL(url);
  }

static  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$query";
    await launchURL(googleMapsUrl);
  }

  static Future<void> openMap(LatLng? latLng) async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${latLng?.latitude},${latLng?.longitude}";
    // 'https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}';
    launchURL(googleUrl);
    // if (!await launchUrl(Uri(path: googleUrl))) {
    //   throw "Could not launch $googleUrl";
    // }
  }

  static Future<void> makePhoneCall(String url) async {
    if (!await launchUrl(Uri(path: url))) throw 'Could not launch $url';
  }

  static Future<void> launchWhatsapp(String number) async {
    final url = "https://wa.me/$number?text=";
    await launchURL(url);
  }

  static Future<void> launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      toast(KStrings.somethingWrong.tr);
      throw 'Could not launch $url';
    }
  }
}
