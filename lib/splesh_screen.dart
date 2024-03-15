

import 'dart:async';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/homnave_scree.dart';
import 'package:paytm_project_sonitecno2/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splesh_screen extends StatefulWidget {
  const Splesh_screen({super.key});

  @override
  State<Splesh_screen> createState() => SpleshScrrenState();
}

class SpleshScrrenState extends State<Splesh_screen> {
  static const String KEYLOGIN = "Login";
  static const String Mobaile = "UserSaveData";
  static const String Password = "UserPassword";
  static const String LoginData = "UserLogaindetails";
 
  

  @override
  void initState() {
    super.initState();
    sedpreprancedata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.skyblue,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 280, left: 120),
              child: Image.asset(
                "assets/images/paytm-logo.png",
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 230,
            ),
          ]),
    );
  }

  Future<void> sedpreprancedata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var isLoggedIn = sp.getBool(KEYLOGIN);

    print({isLoggedIn});
    Timer(const Duration(seconds: 1), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeNaveScreens(
                        index: 0,
                      )));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Logain_screen()));
        }
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Logain_screen()));
      }
    });
  }
}
