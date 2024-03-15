
// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/paytm_home_model.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<LisrData> bannersArray = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: bannersArray.isNotEmpty
          ? SingleChildScrollView(child: buildListView())
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildListView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildContainer(),
        ],
      ),
    );
  }

  Widget buildContainer() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffFFFFFF),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(69, 143, 145, 135),
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.015),
            buildListViewBuilder(),
          ],
        ),
      ),
    );
  }

  Widget buildListViewBuilder() {
    double h = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: bannersArray.length,
      itemBuilder: (context, index) {
        return buildContainerItem(index, h);
      },
    );
  }

  Widget buildContainerItem(int index, double h) {


    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(69, 143, 145, 135),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bannersArray[index].name ?? "",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: h * 0.001),
            buildGridView(index),
          ],
        ),
      ),
    );
  }

  Widget buildGridView(int index) {
    return GridView.builder(
      itemCount: jsonDecode(bannersArray[index].serviceData!).length,
      controller: ScrollController(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 14 / 13,
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, gridIndex) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // Center content horizontally
          children: [
            buildCircleAvatar(
              index,
              jsonDecode(bannersArray[index].serviceData!)[gridIndex]["Image"],
            ),
            Text(
              jsonDecode(bannersArray[index].serviceData!)[gridIndex]["Name"],
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor),
              textAlign: TextAlign.center,
            )

            // Center text horizontally
          ],
        );
      },
    );
  }

  Widget buildCircleAvatar(int index, String gridIndex) {
    return CircleAvatar(
      backgroundColor: AppColors.SalmonColorColor.withOpacity(0.5),
      radius: 21,
      child: Image.network(
        "https://sonitechno.info/images/icon/$gridIndex",
        height: 25,
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getServiceList = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getservicelist","UserID":"$userDataPref","Password":"$userDatapassword", "AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getServiceList!);

        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<LisrData> serviceList =
              jsonList.map((json) => LisrData.fromJson(json)).toList();
          setState(() {
            bannersArray = serviceList;
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
    }
  }

  
}
