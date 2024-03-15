// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_brace_in_string_interps, non_constant_identifier_names, deprecated_member_use, unused_local_variable

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/circularProgressIndicator_class.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/findmemberdetails_model.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FundTransferScreen extends StatefulWidget {
  const FundTransferScreen({Key? key}) : super(key: key);

  @override
  State<FundTransferScreen> createState() => _FundTransferScreenState();
}

class _FundTransferScreenState extends State<FundTransferScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  String? _validateMobail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (value.length > 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  bool isLoading = false;

  GetBillFetchData() {
    if (isLoading == false) {
      setState(() {
        isLoading = true;
      });
    }
  }

  String mobileNumber = '';
  bool showTable = false;
  List<dynamic> dataArray = [];
  List<UserDetails> fundMemberDetails = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Fund Transfer',
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GlobalCircularProgressIndicator(isLoading: isLoading),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 245, 223, 223)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.025),
                        TextFormField(
                          maxLength: 10,
                          onChanged: (value) {
                            FundTransferApi();
                            setState(() {
                              mobileNumber = value;
                              if (value.length == 10) {
                                showTable = true;
                              } else {
                                showTable = false;
                              }
                            });
                          },
                          // controller: mobileController,

                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 0, 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 164, 146, 152)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 140, 124, 130)),
                              ),
                              labelText: 'Mobile Number',
                              hintText: 'Enter a 10-digit phone number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          validator: _validateMobail,
                        ),
                        SizedBox(height: h * 0.002),
                        Tabel(),
                        SizedBox(height: h * 0.02),
                        TextFormField(
                          // controller: mobileController,
                          controller: amountController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 0, 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 164, 146, 152)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 140, 124, 130)),
                              ),
                              labelText: 'Amount',
                              hintText: 'Amount',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the amount';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 35.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  primary: (isLoading == false
                                      ? AppColors.BUttonDisable
                                      : AppColors.Buttancolour),
                                  // Remove border radius
                                ),
                              ),
                            ),
                            SizedBox(width: w * 0.040),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 35.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  _submitForms();
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  primary: (isLoading == true
                                      ? AppColors.BUttonDisable
                                      : AppColors.Buttancolour),
                                  // Remove border radius
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.025),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> FundTransferApi() async {
    try {
      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final findmemberdetails = await MyGlobalFunctions.PostCall(
          '{"MethodName":"findmemberdetails","UserID":"${userDataPref}","Password":"${userDatapassword}", "MobileNo": "${mobileController.text}" }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(findmemberdetails!);

        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<UserDetails> memberListData =
              jsonList.map((json) => UserDetails.fromJson(json)).toList();
          setState(() {
            fundMemberDetails = memberListData;
          });
          Tabel();
        } else if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        } else {
          List<UserDetails> memberListData = List.empty();
          setState(() {
            fundMemberDetails = memberListData;
          });
        }
      }
    } catch (error) {
      // Handle error gracefully
    }
  }

  Future<void> SendFundTransfer() async {
    setState(() {
      isLoading = true;
    });

    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      String? userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();
        final fundtransfer = await MyGlobalFunctions.PostCall(
          '{"MethodName":"fundtransfer","UserID":"${userDataPref}","Password":"${userDatapassword}", "ToUserID":"${mobileController.text}", "Amount": "${amountController.text}"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(fundtransfer!);

        if (data["statuscode"] == "TXN") {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
        } else {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
        }
      }
    } catch (error) {
      // Handle the error here
      print('Error in AmountShowApi(): $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget Tabel() {
    return Visibility(
      visible: showTable,
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fundMemberDetails.isNotEmpty
                        ? fundMemberDetails[0].name.toString()
                        : '',
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'LogainId',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fundMemberDetails.isNotEmpty
                        ? fundMemberDetails[0].loginID.toString()
                        : '',
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fundMemberDetails.isNotEmpty
                        ? fundMemberDetails[0].email.toString()
                        : '',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  

  _submitForms() async {
    if (_formKey.currentState!.validate()) {
      SendFundTransfer();
    }
  }
}
