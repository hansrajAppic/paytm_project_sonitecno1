// ignore_for_file: use_key_in_widget_constructors, avoid_print, camel_case_types, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, prefer_final_fields, non_constant_identifier_names, unnecessary_string_interpolations, prefer_is_empty, prefer_const_constructors, duplicate_ignore

import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:paytm_project_sonitecno2/Json_model/getoprater_model.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: camel_case_types
class RechargeOperator extends StatefulWidget {
  @override
  State<RechargeOperator> createState() => _RechargeOperatorState();
}

class _RechargeOperatorState extends State<RechargeOperator> {
  List<getopraterlist> operatorArray = [];

  @override
  void initState() {
    super.initState();
    apiCall().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 32, 33),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: true,
        title: const Text(
          "Operator",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.024),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            const Text(
              "ALL BILLERS",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: h * 0.024,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.4,
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: operatorArray.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    _handleItemClick(
                        context,
                        opData(
                            opName: operatorArray[index].operatorName, 
                            serviceIDs: operatorArray[index].serviceID,
                            operatorCodes: operatorArray[index].operatorCode,
                            img: operatorArray[index].img,
                            opid: operatorArray[index].iD));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(136, 226, 214, 214),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          operatorArray[index].operatorName.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF0011),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> apiCall() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
    String? userDatapassword = sp.getString(SpleshScrrenState.Password);

    if (userDataPref != null && userDatapassword != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }
      String? getOperators = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getoperators","UserID":"$userDataPref","Password":"$userDatapassword","AppType": " Apps","ServiceTypeID":"1"}',
        "$deviceID",
      );

      final data = json.decode(getOperators!);
      if (data["statuscode"] == "TXN") {
        List<dynamic> jsonList = json.decode(getOperators)['data'];
        List< getopraterlist> operatorsList =
            jsonList.map((json) =>  getopraterlist.fromJson(json)).toList();
        operatorArray = operatorsList;
        setState(() {});
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");

          // Close the app
          exit(0); // Use this line to close the app
        }
      }
    }
  }

  void _handleItemClick(BuildContext context, opData selectedItem) {
    opData oh = selectedItem;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RechargeMobaile(data: oh),
      ),
    );
  }
}

class opData {
  final String? opName;
  final int? serviceIDs;
  final String? operatorCodes;
  final String? img;

  final int? opid;

  opData({
    required this.opName,
    required this.opid,
    required this.img,
    required this.operatorCodes,
    required this.serviceIDs,
  });
}

//

class RechargeMobaile extends StatefulWidget {
  final opData data;

  RechargeMobaile({required this.data});

  @override
  State<RechargeMobaile> createState() => _REchargeMobaileState();
}

class _REchargeMobaileState extends State<RechargeMobaile> {
  static TextEditingController _mobailerController = TextEditingController();
  static TextEditingController _AmountController = TextEditingController();

  List<bool> isSelected = [false, false, false]; //
  void toggleSelection(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        if (i == index) {
          isSelected[i] = !isSelected[i];
        } else {
          isSelected[i] = false;
        }
      }
    });
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    } else if (value.length > 50) {
      return 'Your are big Amount ';
    }
    return null;
  }

  String? _validateMobail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (value.length > 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  static List<String> containerItems = [
    'No',
    'Yes',
  ];
  bool isTapped = false;

  static int selectedContainerIndex = -1;
  Color selectedColor = const Color(0xffB71C1C);
  Color unselectedColor = Colors.white;
  String amountConvertEn = '';

  void amountConvert() {
    setState(() {
      int inputValue = int.tryParse(_AmountController.text) ?? 0;
      amountConvertEn = NumberToWordsEnglish.convert(inputValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    opData hy = widget.data;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffB71C1C),
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 44, //change your color here
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: (const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ))),
        automaticallyImplyLeading: true,
        title: const Text(
          " Mobile Recharge",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: SingleChildScrollView(
          // reverse: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.034,
                  ),
                  // const Text(
                  //   "Prepaid Airtel${}",
                  //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  // ),
                  Text(
                    "${hy.opName}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change operator",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB71C1C),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TextFormField(
                    maxLines: 1,
                    autofocus: true,
                    onSaved: (val) {},
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    controller: _mobailerController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone_iphone_rounded),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 8, 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 164, 146, 152)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 140, 124, 130)),
                        ),
                        labelText: 'Mobaile Number',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(136, 89, 86, 86)),
                        hintText: 'Enter a 10-digit phone number',
                        border: OutlineInputBorder()),
                    validator: _validateMobail,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    textAlign: TextAlign.start,
                    onChanged: (content) {
                      amountConvert();
                    },
                    keyboardType: TextInputType.number,
                    controller: _AmountController,
                    validator: _validatePassword,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 8, 0),
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.red),
                        hintStyle: TextStyle(),
                        hintText: 'Amount',
                        border: OutlineInputBorder()),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: w * 0.028),
                    child: Text(
                      "${amountConvertEn}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: h * 0.05,
                        width: w * 0.45,
                        decoration: BoxDecoration(
                            color: const Color(0xffad0004),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          " BROWSE PLANS",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: h * 0.05,
                        width: w * 0.45,
                        decoration: BoxDecoration(
                            color: const Color(0xffad0004),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          "ROFFER",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 235, 231, 231)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.39,
                  ),
                  SizedBox(
                    height: h * 0.064,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        backgroundColor: const Color(0xffad0004),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                        // showProgressDialog(context);
                        if (_AmountController.text.characters.length > 0) {
                          showProgressDialog(context);
                        }
                      },
                      child: const Text(
                        "PROCEED TO RECHARGE",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 235, 231, 231)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 15)),
                ]),
          ),
        ),
      ),
    );
  }

  showProgressDialog(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.data.opName}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF0011)),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                height: h * 0.044,
                decoration: BoxDecoration(
                  color: const Color(0xffad0004),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Confirm Recharge",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 231, 231)),
                  ),
                ),
              ),
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Mobaile Number :${_mobailerController.text}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text("Amount :${_AmountController.text}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  SizedBox(
                    height: h * 0.048,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: containerItems.length,
                        itemBuilder: (context, index) {
                          return (InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  selectedContainerIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.01),
                                child: Container(
                                    width: w * 0.3,
                                    decoration: BoxDecoration(
                                        // color: Colors.white,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 197, 188, 188)),
                                        color: selectedContainerIndex == index
                                            ? selectedColor
                                            : unselectedColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        containerItems[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    )),
                              )));
                        }),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
