// import 'dart:convert';

// import 'package:bype_techno_projects1/Json_model/company_detttils_model.dart';
// import 'package:bype_techno_projects1/splesh_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePaze extends StatefulWidget {
//   const HomePaze({Key? key}) : super(key: key);

//   @override
//   State<HomePaze> createState() => _HomePazeState();
// }

// class _HomePazeState extends State<HomePaze> {
//   List<Dettilslist> logainArray = [];

//   @override
//   void initState() {
//     super.initState();
//     performApiCall();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SizedBox(
//         height: 800,
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: logainArray.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(logainArray[index].address ?? ''),
//               // subtitle: Image.network(logainArray[index].logo ?? ''),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> performApiCall() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? datf = prefs.getString(SpleshScrrenState.LoginData);
//     final data = json.decode(datf!);

//     if (data["statuscode"] == "TXN") {
//       List<dynamic> jsonList = json.decode(datf)['data'];
//       List<Dettilslist> getlogindetails =
//           jsonList.map((json) => Dettilslist.fromJson(json)).toList();

//       setState(() {
//         logainArray = getlogindetails;
//       });
//     } else {
//       if (data["status"].toString() == "UnAuthorized Person") {
//         Fluttertoast.showToast(
//           msg: "UnAuthorized Person!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       }
//     }
//   }
// }
