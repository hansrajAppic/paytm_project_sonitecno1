// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, unused_local_variable, unused_field, avoid_print, use_build_context_synchronously, duplicate_ignore

import 'dart:convert';

// import 'package:bype_techno_projects1/Globale_class/colors.dart';
// import 'package:bype_techno_projects1/Json_model/bbpsoperator_model.dart';
// import 'package:bype_techno_projects1/Json_model/recwayrdfid_model.dart';
// import 'package:bype_techno_projects1/bill_pay_screen.dart';
// import 'package:bype_techno_projects1/dashboard_screen.dart';
// import 'package:bype_techno_projects1/globale_class.dart';
// import 'package:bype_techno_projects1/splesh_screen.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/bbpsoperator_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/recwayrdfid_model.dart';
import 'package:paytm_project_sonitecno2/bill_pay_screen.dart';
import 'package:paytm_project_sonitecno2/dashboard_screen.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bbps_screen extends StatefulWidget {
  final String ServiceName;

  const Bbps_screen({super.key, required this.ServiceName});

  @override
  State<Bbps_screen> createState() => _Bbps_screenState();
}

class _Bbps_screenState extends State<Bbps_screen> {
  List<Datum> flitterdataArray = [];

  List<Datum> filteredItems = [];

  // Add more items with 'bbsname', 'category', 'price', etc.

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // filteredItems.addAll(items);

    BbpsFiltterDataApi(widget.ServiceName);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: TextField(
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.blackColor),
                                                  onChanged: (value) {
                                                    filterItems(value);
                                                  },
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    hintText:
                                                        'Search by biller...',
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
                                            color: AppColors
                                                .blackLightnessSilverColor,
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
                      if (flitterdataArray
                          .isNotEmpty) // Conditionally render ListView if flitterdataArray is not empty
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.lightWhiteColor,
                            borderRadius: BorderRadius.only(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12, top: 12),
                                child: Text(
                                  "Billers in Rajsthan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListView.builder(
                                controller: ScrollController(),
                                shrinkWrap: true,
                                itemCount: flitterdataArray.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Billfetch_Screen ()));
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            _BItemClick(
                                                context,
                                                myslectItm(
                                                  bbsname:
                                                      flitterdataArray[index]
                                                          .name,
                                                  bbpsdatumClass:
                                                      flitterdataArray[index]
                                                          .datumClass,
                                                  bbpsid:
                                                      flitterdataArray[index]
                                                          .id,
                                                ));
                                          },
                                          child: ListTile(
                                            leading: Container(
                                              height: h * 0.045,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255,
                                                      232,
                                                      215,
                                                      215), // Set border color here
                                                  // Set border width here
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Set border radius here
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                                child: Image.network(
                                                  "https://sonitechno.info/images/icon/${flitterdataArray[index].datumClass ?? ""}",
                                                  height: 28,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              flitterdataArray[index].name ??
                                                  "Default Name", // Provide a default bbsname if it's null
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 39),
                                        child: const Divider(
                                          indent: 27.0,
                                          color: Color.fromARGB(
                                              255, 215, 208, 208),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ]),
        ));
  }

  void filterItems(String query) {
    setState(() {
      flitterdataArray = filteredItems
          .where((item) =>
              (item.name?.toLowerCase() ?? '').contains(query.toLowerCase()) ||
              (item.datumClass?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> BbpsFiltterDataApi(String ServiceName) async {
    try {
      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final bbpsoperator = await MyGlobalFunctions.PostCall(
          '{"MethodName":"bbpsoperator","UserID":"$userDataPref","Password":"$userDatapassword", "ServiceName":"$ServiceName","AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(bbpsoperator!);

        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<Datum> serviceList =
              jsonList.map((json) => Datum.fromJson(json)).toList();

          setState(() {
            flitterdataArray = serviceList;
            filteredItems = List.from(serviceList);
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      // Handle error gracefully
    }
  }

  void _BItemClick(BuildContext context, myslectItm selectedItem) {
    myslectItm mybbpsvar = selectedItem;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Billfetch_Screen(datas: mybbpsvar),
      ),
    );
  }
}

class myslectItm {
  final String? bbsname;
  final String? bbpsid;
  String? bbpsdatumClass;
  myslectItm({
    required this.bbsname,
    required this.bbpsid,
    required this.bbpsdatumClass,
  });
}

class Billfetch_Screen extends StatefulWidget {
  final myslectItm datas;

  Billfetch_Screen({super.key, required this.datas});

  @override
  _TextInputClassState createState() => _TextInputClassState();
}

class _TextInputClassState extends State<Billfetch_Screen> {
  List<TEXTFILD> TextfildArray = [];
  late myslectItm fetData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    myslectItm;
    fetchData(widget.datas.bbpsid);
  }

  TextEditingController _AmountControllers = TextEditingController();
  final Map<String, TextEditingController> controllers = {};
  final _formKey = GlobalKey<FormState>();

  void Togselctionn(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // myslectItm datanum = widget.datas;

    String? bbsname = widget.datas.bbsname;
    String? bbpsid = widget.datas.bbpsid;
    String? bbpsdatumClass = widget.datas.bbpsdatumClass;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 2,
        ),
        child: SizedBox(
          height: h * 0.06,
          child: TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                GetBillFetchData();
              }
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              backgroundColor: (_isLoading == true
                  ? AppColors.BUttonDisable
                  : AppColors.Buttancolour),
              // Remove border radius
            ),
            child: Text(
              "CONFRIM",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
              ),
            ),
          ),

          // bottomNavigationBar: Padding(
          //   padding: EdgeInsets.only(
          //     bottom: MediaQuery.of(context).viewInsets.bottom + 2,
          //   ),
          //   child: SizedBox(
          //     height: h * 0.06,
          //     child: TextButton(
          //       onPressed: () {
          //         if (_formKey.currentState!.validate()) {
          //           GetBillFetchData();
          //         }
          //       },
          //       style: TextButton.styleFrom(
          //         backgroundColor: (_isLoading == true
          //             ? AppColors.BUttonDisable
          //             : AppColors.Buttancolour),
          //         // Remove border radius
          //       ),
          //       child: Text(
          //         "CONFRIM",
          //         style: TextStyle(
          //           fontSize: 13,
          //           fontWeight: FontWeight.w400,
          //           color: AppColors.whiteColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.LightnessSilverColor,
      appBar: AppBar(
        backgroundColor: AppColors.PinkColors,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "$bbsname",
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: h * 0.070,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.darkwhiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.03),
                      child: const ListTile(
                        leading: Icon(
                          Icons.book,
                          color: AppColors.blackColor,
                          size: 25,
                        ),
                        title: Text(
                          "Viw Simple Bill",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 115, 92, 217)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.darkwhiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 143, 145, 135),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount: TextfildArray.length,
                          itemBuilder: (context, index) {
                            final textfild = TextfildArray[index];
                            final key = textfild.labels ?? "";
                            final controller = controllers[key] ??
                                TextEditingController(); // Get the existing controller or create a new one
                            controllers[key] = controller;

                            return TextFormField(
                              maxLength: textfild.fieldMaxLen,
                              validator: (value) {
                                print(
                                    'fieldMinLen: ${textfild.fieldMinLen}'); // Print fieldMinLen for debugging
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter ${textfild.labels}';
                                } else if (value.length <
                                    (textfild.fieldMinLen ?? 0)) {
                                  return 'Please Enter at least ${textfild.fieldMinLen} digits';
                                } else if (value.length >
                                    (textfild.fieldMaxLen ?? 12)) {
                                  return 'Please Enter at most ${textfild.fieldMaxLen} digits';
                                }
                                return null;
                              },

                              controller:
                                  controller, // Use the controller variable here
                              decoration: InputDecoration(
                                hintText: key,
                                hintStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: const UnderlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  height: h * 0.060,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.darkwhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(69, 143, 145, 135),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: w * 0.06, vertical: 7),
                    child: const Text(
                      "Paying this bill allows PhonePe to fetch your current and\nfuture bills so that you can view and pay them.",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: !_isLoading
                      ? const Text("")
                      : const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   child: TextButton(
      //     style: TextButton.styleFrom(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(6),
      //         ),
      //         backgroundColor: (_isLoading == true
      //             ? AppColors.BUttonDisable
      //             : AppColors.Buttancolour)),
      //     onPressed: () {
      //       if (_formKey.currentState!.validate()) {
      //         GetBillFetchData();
      //       }
      //     },
      //     child: const Text(
      //       "CONFIRM",
      //       style: TextStyle(
      //           fontSize: 13,
      //           fontWeight: FontWeight.w400,
      //           color: AppColors.ButtonTextColor),
      //     ),
      //   ),
      // ),
    );
  }

  GetBillFetchData() {
    if (_isLoading == false) {
      setState(() {
        _isLoading = true;
      });
      Map<String, dynamic> jsonObject = {
        'OperatorID': widget.datas.bbpsid,
        'Optional1': "",
        'Optional2': "",
        'Optional3': "",
        'Optional4': "",
        'Optional5': "",
        'Optional6': "",
        'Optional7': "",
        'Optional8': "",
        'Optional9': "",
      };

      for (int index = 0; index < controllers.length; index++) {
        var entry = controllers.entries.elementAt(index);

        // ignore: prefer_interpolation_to_compose_strings
        jsonObject["Optional" + (index + 1).toString()] = entry.value.text;
      }
      BillFetchAPI(jsonObject);
    }
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  Future<void> BillFetchAPI(Map<String, dynamic> jsonObject) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final requiredfield = await MyGlobalFunctions.PostCall(
            '{"Number":"elebill","MethodName":"elebill","UserID":"$userDataPref","Password":"$userDatapassword", "OperatorID":"${jsonObject["OperatorID"].toString()}","AppType": "Apps","Optional1": "${jsonObject["Optional1"].toString()}", "Optional2": "${jsonObject["Optional2"].toString()}","Optional3": "${jsonObject["Optional3"].toString()}","Optional4": "${jsonObject["Optional4"].toString()}","Optional5": "${jsonObject["Optional5"].toString()}","Optional6": "${jsonObject["Optional6"].toString()}","Optional7": "${jsonObject["Optional7"].toString()}","Optional8": "${jsonObject["Optional8"].toString()}","Optional9": "${jsonObject["Optional9"].toString()}"}',
            "$deviceID");

        final Map<String, dynamic> data = json.decode(requiredfield!);

        if (data["statuscode"] == null) {
          Map<String, dynamic> ResultBllFetch;
          ResultBllFetch = data;
          ResultBllFetch["OperatorID"] = jsonObject["OperatorID"].toString();
          ResultBllFetch["OperatorName"] = widget.datas.bbsname;
          ResultBllFetch["OperatorLogo"] = widget.datas.bbpsdatumClass;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BillPAY_Screen(
                        ResultBllFetch: ResultBllFetch,
                      )));
        } else if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.errorMessage(context, "UnAuthorized Person!");
        } else {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
        }
        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      // Handle error gracefully
    }
  }

  Future<void> fetchData(String? id) async {
    try {
      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);
      myslectItm sdata = widget.datas;
      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final requiredfield = await MyGlobalFunctions.PostCall(
          '{"MethodName":"requiredfield","UserID":"$userDataPref","Password":"$userDatapassword", "spkey":"$id","AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(requiredfield!);

        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<TEXTFILD> serviceList =
              jsonList.map((json) => TEXTFILD.fromJson(json)).toList();
          setState(() {
            TextfildArray = serviceList;
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      // Handle error gracefully
    }
  }
}
