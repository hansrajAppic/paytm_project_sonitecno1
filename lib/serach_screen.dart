// ignore_for_file: prefer_const_constructors

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/Global.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/company_logain_details_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/paytm_home_model.dart';
import 'package:paytm_project_sonitecno2/bbps_screen.dart';
import 'package:paytm_project_sonitecno2/dashboard_screen.dart';
import 'package:paytm_project_sonitecno2/dth_screen.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/search_contactslist_screen.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SerachScreen extends StatefulWidget {
  const SerachScreen({Key? key}) : super(key: key);

  @override
  State<SerachScreen> createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
  List<LisrData> bannersArray = [];

  List<LisrData> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _assignCustomerData();
    fetchData();
  }

  Global globalInstance = Global();
  CompanyData? companyData;

  void _assignCustomerData() async {
    companyData = await globalInstance.getCompanyData();
    setState(() {
      companyData = companyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    // First Container
                    Container(
                      width: double.infinity,
                      height: h * 0.11,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.PinkColors,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),

                    // Second Container
                    Positioned(
                      top: h * 0.045, // Adjust the top position as needed
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.02,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * 0.02,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashBord_Screen(),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 20,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.04,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: TextField(
                                              style: const TextStyle(
                                                  color: AppColors.blackColor),
                                              onChanged: (value) {
                                                filterItems(value);
                                              },
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText: 'Search by biller...',
                                                hintStyle: TextStyle(
                                                  color: AppColors
                                                      .blackLightnessSilverColor,
                                                  fontSize: 14,
                                                ),
                                              ).copyWith(isDense: true),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.help_outline,
                                        size: 20,
                                        color:
                                            AppColors.blackLightnessSilverColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WeLcome to All Service ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.0),
                  buildListView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void filterItems(String query) {
    setState(() {
      bannersArray = filteredItems
          .where((item) =>
              (item.name?.toLowerCase() ?? '').contains(query.toLowerCase()) ||
              (item.serviceData?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget buildListView() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContainer(),
        ],
      ),
    );
  }

  Widget buildContainer() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildListViewBuilder(),
      ],
    );
  }

  Widget buildListViewBuilder() {
    double h = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: bannersArray.length,
      itemBuilder: (context, index) {
        return buildContainerItem(index, h);
      },
    );
  }

  Widget buildContainerItem(int index, double h) {
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor,
          boxShadow: [
            const BoxShadow(
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
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 14 / 13,
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, gridIndex) {
        return InkWell(
          onTap: () {
            callsingle(context,
                jsonDecode(bannersArray[index].serviceData!)[gridIndex]);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCircleAvatar(
                index,
                jsonDecode(bannersArray[index].serviceData!)[gridIndex]
                    ["Image"],
              ),
              Text(
                jsonDecode(bannersArray[index].serviceData!)[gridIndex]["Name"],
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor),
                textAlign: TextAlign.center,
              )

              // Center text horizontally
            ],
          ),
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

  void callsingle(BuildContext context, dynamic data) {
    if (data["Onoff"] == true) {
      if (data["ID"].toString() == "1") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Serch_contacts_Screen(),
          ),
        );
      } else if (data["ID"].toString() == "3") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dth_Screen()),
        );
      } else if (data["SectionType"].toString() == "2") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Bbps_screen(ServiceName: data["Name"].toString())),
        );
      }
    } else {
      MyGlobalFunctions.showAlert(context, data["Reason"].toString());
    }
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
            filteredItems = List.from(serviceList);
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
