// // ignore_for_file: unused_local_variable, camel_case_types, avoid_print

// import 'dart:convert';

// import 'package:bype_techno_projects1/Json_model/login_model.dart';
// import 'package:bype_techno_projects1/splesh_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:sonitecno_paytym_apps/Json_model/login_model.dart';
// // import 'package:sonitecno_paytym_apps/splesh_paytm_screen.dart';

// class Profile_Logain_pag extends StatefulWidget {
//   const Profile_Logain_pag({super.key});

//   @override
//   State<Profile_Logain_pag> createState() => _Profile_Logain_pagState();
// }

// class _Profile_Logain_pagState extends State<Profile_Logain_pag> {
//   List<Datum> logainArray = [];
//   bool isLoading = true;
//   String? error;

//   @override
//   void initState() {
//     super.initState();
//     // Call the API when the widget is created
//     ProfileApiCall();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           " profile",
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         backgroundColor: Colors.red,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: h * 0.05),
//             Center(
//               child: Image.asset(
//                 "assets/images/rsz_1sonitecno.png",
//                 height: 40,
//               ),
//             ),
//             const SizedBox(height: 50),
//             const Center(
//               child: Text(
//                 "RETAILER",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             buildInfoItem("Mobaile No",
//                 logainArray.isNotEmpty ? logainArray[0].userid ?? "" : ""),
//             buildInfoItem("Email id",
//                 logainArray.isNotEmpty ? logainArray[0].email ?? "" : ""),
//             buildInfoItem("User Name",
//                 logainArray.isNotEmpty ? logainArray[0].username ?? "" : ""),
//             buildInfoItem("User id",
//                 logainArray.isNotEmpty ? logainArray[0].userid ?? "" : ""),
//             buildInfoItem("Pan No",
//                 logainArray.isNotEmpty ? logainArray[0].pan ?? "" : ""),
//             buildInfoItem("Aadhar no",
//                 logainArray.isNotEmpty ? logainArray[0].aadhar ?? "" : ""),
//             buildInfoItem("Joining Date ",
//                 logainArray.isNotEmpty ? logainArray[0].adddate ?? "" : ""),
//             SizedBox(height: h * 0.2),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildInfoItem(String label, String value) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: w * 0.044),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: h * 0.01),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//           SizedBox(height: h * 0.01),
//           Container(
//             height: h * 0.070,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               border:
//                   Border.all(color: const Color.fromARGB(255, 137, 126, 126)),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(8),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(value),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> ProfileApiCall() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       print(prefs.getString(SpleshScrrenState.LoginData));

//       String? datf = prefs.getString(SpleshScrrenState.LoginData);
//       final data = json.decode(datf!);

//       if (data["statuscode"] == "TXN") {
//         List<dynamic> jsonList = json.decode(datf)['data'];
//         List<Datum> getlogindetails =
//             jsonList.map((json) => Datum.fromJson(json)).toList();

//         setState(() {
//           logainArray = getlogindetails;
//           isLoading = false;
//         });
//       } else {
//         if (data["status"].toString() == "UnAuthorized Person") {
//           Fluttertoast.showToast(
//             msg: "UnAuthorized Person!",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//           // ignore: use_build_context_synchronously
//         }
//       }
//     }
//   }
// }
