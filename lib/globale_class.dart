// ignore_for_file: unused_local_variable, use_build_context_synchronously, prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps

import 'dart:io';


import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/login_screen.dart';


class MyGlobalFunctions {
  String? deviceID = '';
  static Future<String?> getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    try {
      if (!kIsWeb) {
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          deviceId = androidInfo.androidId;
        } else if (Platform.isIOS) {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          deviceId = iosInfo.identifierForVendor;
        }
      } else {}
    } catch (e) {
      print('');
    }
    return deviceId;
  }
 
// ignore: non_constant_identifier_names
    static Future<String>? GetIP () async {
     {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      return data.toString();
   
    } 
  }

  static showAlertDialog(BuildContext context, String data) async {
    bool isLoading = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/mantrara.png",
                height: 90,
              ),
              const SizedBox(
                height: 02,
              ),
              const Text(
                "Session expired due to inactivi",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentreenBlue),
              ),
              const SizedBox(
                height: 02,
              ),
              const Text(
                "If you wish to continue working, Re-enter",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 020,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.accentreenBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(data.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor)),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Logain_screen()));
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  static showAlert(BuildContext context, String data) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/mantrara.png",
                height: 90,
              ),
              const SizedBox(
                height: 02,
              ),
              const Text(
                "Service Down due to inactivity",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentreenBlue),
              ),
              const SizedBox(
                height: 02,
              ),
              const Text(
                "If you wish to continue working, Re-enter",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 020,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.accentreenBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(data,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor)),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  myCircularProgressIndicator() {
    bool _isLoading = false;
    CircularProgressIndicator();
  }

  static errorMessage(BuildContext context, String data) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/mantrara.png",
                height: 90,
              ),
              const SizedBox(
                height: 02,
              ),
              Text(
                data,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentreenBlue),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  static String? dataApi = "";
  // ignore: non_constant_identifier_names
  static Future<String?> PostCall(String Data, String? deviceID) async {
    var headers = {
      'DeviceID': '$deviceID',
      'Cookie':
          'ASP.NET_SessionId=gg5uofsoxsrba1uv0egdcwrg; ASP.NET_SessionId=b4qkrzbfle40tws0hkysbufq'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://sonitechno.info/api/mobileapi.aspx"));

    request.fields.addAll({'Request': Data});
    print(" Request response >>>>>>>>>>>>>>>>>>>${Data}");

    request.headers.addAll(headers);
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
