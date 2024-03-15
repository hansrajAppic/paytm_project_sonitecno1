// // import 'package:flutter/material.dart';

// // class Name extends StatefulWidget {
// //   const Name({Key? key}) : super(key: key);

// //   @override
// //   State<Name> createState() => _NameState();
// // }

// // class _NameState extends State<Name> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             // Call the function when the button is pressed
// //             Profailepfuncation(
// //               context,
// //               Profile_succfuly(
// //                   userid: "exampleUserId", roleId: "exampleRoleId"),
// //             );
// //           },
// //           child: Text('Go to Dashboard'),
// //         ),
// //       ),
// //     );
// //   }

// //   void Profailepfuncation(
// //       BuildContext context, Profile_succfuly LogainDetills) {
// //     Profile_succfuly Datunum = LogainDetills;
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => DashboardScreen(
// //           userId: Datunum.userid,
// //           roleId: Datunum.roleId,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Profile_succfuly {
// //   final String? userid;
// //   final String? roleId;

// //   Profile_succfuly({
// //     required this.userid,
// //     required this.roleId,
// //   });
// // }

// // class DashboardScreen extends StatelessWidget {
// //   final String? userId;
// //   final String? roleId;

// //   const DashboardScreen({Key? key, this.userId, this.roleId}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     // Use userId and roleId as needed in your widget
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Dashboard'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text('User ID: $userId'),
// //             Text('Role ID: $roleId'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: Name(),
// //   ));
// // }
// // ignore_for_file: unused_local_variable, camel_case_types, avoid_print

// import 'dart:convert';
// import 'package:bype_techno_projects1/Globale_class/colors.dart';
// import 'package:bype_techno_projects1/Json_model/company_detttils_model.dart';
// import 'package:bype_techno_projects1/splesh_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyProfile_Screen extends StatefulWidget {
//   const MyProfile_Screen({super.key});

//   @override
//   State<MyProfile_Screen> createState() => _MyProfile_ScreenState();
// }

// class _MyProfile_ScreenState extends State<MyProfile_Screen> {
//   List<Dettilslist> logainArray = [];
//   bool isLoading = true;
//   String? error;

//   @override
//   void initState() {
//     super.initState();
//     // Call the API when the widget is created
//     performApiCall();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Icon(
//             Icons.help_outline_outlined,
//             color: Colors.white,
//             size: 22,
//           ),
//           SizedBox(
//             width: w * 0.02,
//           )
//         ],
//         backgroundColor: AppColors.PinkColors,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'MY PROFILE',
//           style: const TextStyle(
//               color: AppColors.whiteColor,
//               fontSize: 16,
//               fontWeight: FontWeight.w800),
//         ),
//       ),
//       // appBar: AppBar(
//       //   title: const Text(
//       //     " profile",
//       //     style: TextStyle(
//       //       fontSize: 18,
//       //       color: Colors.white,
//       //       fontWeight: FontWeight.w500,
//       //     ),
//       //   ),
//       //   backgroundColor: Colors.red,
//       //   leading: IconButton(
//       //     icon: const Icon(
//       //       Icons.arrow_back,
//       //       color: Colors.white,
//       //     ),
//       //     onPressed: () => Navigator.of(context).pop(),
//       //   ),
//       // ),
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
//                 logainArray.isNotEmpty ? logainArray[0].logo ?? "" : ""),
           
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

//   Future<void> performApiCall() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       print(prefs.getString(SpleshScrrenState.LoginData));

//       String? datf = prefs.getString(SpleshScrrenState.LoginData);
//       final data = json.decode(datf!);

//       if (data["statuscode"] == "TXN") {
//         List<dynamic> jsonList = json.decode(datf)['data'];
//         List<Dettilslist> getlogindetails =
//             jsonList.map((json) =>  Dettilslist .fromJson(json)).toList();

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

// void Profailepfuncation(BuildContext context, Profile_succfuly LogainDetills) {
//   Profile_succfuly oh = LogainDetills;
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => DashboardScreen(data: oh),
//     ),
//   );
// }

// class Profile_succfuly {
//   final String? userid;
//   final String? roleId;

//   Profile_succfuly({
//     required this.userid,
//     required this.roleId,
//   });
// }

// class DashboardScreen extends StatelessWidget {
//   final Profile_succfuly data;

//   DashboardScreen({required this.data});
//   @override
//   Widget build(BuildContext context) {
//     Profile_succfuly tems = data;
//     // Use userId and roleId as needed in your widget
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Corporate Id: ${tems.roleId}', // Corrected: removed unnecessary quotation marks and comma
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
