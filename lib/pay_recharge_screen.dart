// ignore_for_file: non_constant_identifier_names, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, camel_case_types

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/recharge_share_receipt_Screen.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayRecharge_Screen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Map<String, String> SearchData;
  // ignore: non_constant_identifier_names
  const PayRecharge_Screen({super.key, required this.SearchData});

  @override
  State<PayRecharge_Screen> createState() => _PayRecharge_ScreenState();
}

class _PayRecharge_ScreenState extends State<PayRecharge_Screen> {
  List<dynamic> RechargerequestapiArray = [];
  bool isLoading = false;
  bool isButtonDisabled = false;

  GetBillFetchData() {
    if (isLoading == false) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //  PayRecharge_Screen(widget.SearchData);
  }



 

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 2,
          ),
          child: SizedBox(
            height: h * 0.06,
            child: TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      RechargerequestapiCall(
                          widget.SearchData["operatorID"].toString(),
                          widget.SearchData["stateID"].toString(),
                          widget.SearchData["Phone"].toString(),
                          widget.SearchData["RechargeAmunt"].toString());
                    },
              style: TextButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  backgroundColor: isLoading
                      ? AppColors.BUttonDisable
                      : AppColors.Buttancolour),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: Colors.white) // Show loading indicator
                  : Text(
                      "PROCEED TO PAY",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),

          // bottomNavigationBar: SizedBox(
          //   height: h * 0.064,
          //   width: double.infinity,
          //   child: Padding(
          //     padding:
          //         EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.002),
          //     child: TextButton(
          //       onPressed: () {
          //         GetBillFetchData();
          //         RechargerequestapiCall(
          //             widget.SearchData["operatorID"].toString(),
          //             widget.SearchData["stateID"].toString(),
          //             widget.SearchData["Phone"].toString(),
          //             widget.SearchData["RechargeAmunt"].toString());
          //       },
          //       style: TextButton.styleFrom(
          //           backgroundColor: (isLoading == true
          //               ? AppColors.BUttonDisable
          //               : AppColors.Buttancolour)),
          //       child: const Text(
          //         "PROCEED TO Pay",
          //         style: TextStyle(
          //             fontSize: 13,
          //             fontWeight: FontWeight.w400,
          //             color: Color.fromARGB(255, 235, 231, 231)),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        appBar: AppBar(
          actions: [
            Icon(
              Icons.help_outline_outlined,
              color: Colors.white,
              size: 22,
            ),
            SizedBox(
              width: w * 0.02,
            )
          ],
          backgroundColor: AppColors.PinkColors,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Pay",
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
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
                      ListTile(
                        leading: CircleAvatar(
                          maxRadius: 18,
                          backgroundColor: AppColors.Buttancolour,
                          child: Text(
                            "Jio",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                        title: Text(
                          "Self",
                          style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          widget.SearchData["Phone"].toString(),
                          style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Divider(
                        color: AppColors.DivaiderblackColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: h * 0.036,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.DivaiderblackColor,
                                    ),
                                    borderRadius: BorderRadius.circular(22)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.SearchData["operator"].toString(),
                                      style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 22,
                                      color: AppColors.DivaiderblackColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                height: h * 0.036,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.DivaiderblackColor,
                                    ),
                                    borderRadius: BorderRadius.circular(22)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.SearchData["state"].toString(),
                                      style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.DivaiderblackColor,
                                      size: 22,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // GlobalCircularProgressIndicator(
                      //   isLoading: isLoading,
                      // ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffebeff2),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(69, 143, 145, 135),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₹${widget.SearchData["RechargeAmunt"]}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: h * 0.037,
                                          width: w * 0.3,
                                          decoration: BoxDecoration(
                                              color: AppColors.PinkColors,
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(22)),
                                          child: Text(
                                            "CHANGE PLAN",
                                            style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Data:",
                                        style: const TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        " 2.5 GB/Day",
                                        style: const TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: w * 0.0600,
                                      ),
                                      Text(
                                        widget.SearchData["validity"]
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    widget.SearchData["planDescription"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: h * 0.025,
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  )
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.3,
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> RechargerequestapiCall(
    String opid,
    String stateid,
    String mobilenumber,
    String amount,
  ) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
    String? userDatapassword = sp.getString(SpleshScrrenState.Password);

    if (userDataPref != null && userDatapassword != null) {
      String? deviceID = "";
      String? ipadders = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {}

      try {
        String? ip = await MyGlobalFunctions.GetIP();
        ipadders = ip;
      } catch (error) {}

      String? rechargerequest = await MyGlobalFunctions.PostCall(
        '{ "MethodName": "rechargerequest",  "UserID": "$userDataPref",  "Password": "$userDatapassword",  "Number": "$mobilenumber",  "Amount": "$amount",  "Operator": "$opid",  "Circle": "$stateid",  "CANumber": "",  "Cycle": "",  "DueDate": "$mounted",  "Account": "",  "IPAddress": "$ipadders",  "IMEINumber": "",  "CustomerName": "",  "CustomerMobile": ""}',
        "$deviceID",
      );

      final data = json.decode(rechargerequest!);
      if (data["statuscode"] == "TXN") {
        Map<String, dynamic> userMap = data["data"];
        Recharge_succfuly rechargeData = Recharge_succfuly.fromJson(userMap);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RechargeShare_receipt_Screen(Data: rechargeData),
            ));
      } else {
        MyGlobalFunctions.errorMessage(context, data["status"].toString());
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}

class Recharge_succfuly {
  final String? Message;
  final String? serviceIDs;
  final String? operatorCodes;
  final String? RechargeStatus;
  final String? TransactionID;
  final String? OPID;
  final String? Balance;
  final String? Amount;
  final String? DateTime;
  final String? OPERATORNAME;
  final String? Number;

  factory Recharge_succfuly.fromJson(Map<String, dynamic> json) {
    return Recharge_succfuly(
      Message: json['Message'],
      serviceIDs: json['serviceIDs'],
      operatorCodes: json['operatorCodes'],
      RechargeStatus: json['RechargeStatus'],
      TransactionID: json['TransactionID'],
      OPID: json['OPID'],
      Balance: json['Balance'],
      Amount: json['Amount'],
      DateTime: json['DateTime'],
      OPERATORNAME: json['OPERATORNAME'],
      Number: json['Number'],
    );
  }

  Recharge_succfuly({
    required this.Message,
    required this.serviceIDs,
    required this.operatorCodes,
    required this.RechargeStatus,
    required this.TransactionID,
    required this.OPID,
    required this.Amount,
    required this.Balance,
    required this.DateTime,
    required this.OPERATORNAME,
    required this.Number,
  });
}
