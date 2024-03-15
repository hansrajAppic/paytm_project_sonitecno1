
// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/getbanklist_model.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Payment_request_Screen extends StatefulWidget {
  const Payment_request_Screen({Key? key}) : super(key: key);

  @override
  State<Payment_request_Screen> createState() => _Payment_request_ScreenState();
}

class _Payment_request_ScreenState extends State<Payment_request_Screen> {
  TextEditingController _bankController = TextEditingController();
  TextEditingController _accountController = TextEditingController();
  TextEditingController _ifscController = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  List<GetbankList> dropDownArry = [];
  List<GetbankList> filteredBanks = [];
  GetbankList? _selectedBank;

  @override
  void initState() {
    super.initState();
    getbanklistapi();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          " Add Bank",
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.03),
              Text('Select Bank:'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        filterBanks(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Bank',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<GetbankList>(
                        isExpanded: true,
                        value: _selectedBank,
                        items: filteredBanks.map((GetbankList bank) {
                          return DropdownMenuItem<GetbankList>(
                            value: bank,
                            child: Text(bank.name ?? ""),
                          );
                        }).toList(),
                        onChanged: (GetbankList? value) {
                          setState(() {
                            _selectedBank = value;
                          });
                        },
                        hint: Text('Select Bank'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.007),
              Text('Account Number:'),
              TextFormField(
                controller: _accountController,
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: 'Enter account number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: h * 0.007),
              Text('IFSC Code:'),
              TextFormField(
                controller: _ifscController,
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: 'Enter IFSC code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: h * 0.024),
              TextFormField(
                controller: _accountController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_add_alt),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: 'Account Holder Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text('IFSC Code:'),
              TextFormField(
                controller: _ifscController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_balance_sharp),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: 'Branch',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Table(
                  border: TableBorder.all(color: Colors.black, width: 1.0),
                  children: [
                    TableRow(children: [
                      Text(
                        " Branch",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        " Bank",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        " Adders",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ]),
              SizedBox(height: h * 0.07),
              SizedBox(
                height: h * 0.06,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.002),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                    onPressed: () {
                      // Add logic to save bank details
                    },
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bankController.dispose();
    _accountController.dispose();
    _ifscController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> getbanklistapi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
    String? userDatapassword = sp.getString(SpleshScrrenState.Password);
    if (userDataPref != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }

      String? getbanner = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getbanklist","UserID":"$userDataPref","Password":"$userDatapassword", "AppType": " Apps"  }',
        "$deviceID",
      );

      final data = json.decode(getbanner!);
      if (data["statuscode"] == "TXN") {
        List<dynamic> jsonList = json.decode(getbanner)['data'];
        List<GetbankList> getBanner =
            jsonList.map((json) => GetbankList.fromJson(json)).toList();
        dropDownArry = getBanner;
        setState(() {
          filteredBanks = getBanner;
          if (_selectedBank != null && !filteredBanks.contains(_selectedBank)) {
            _selectedBank = null; // Clear selected bank if not in the list
          }
        });
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    }
  }

  void filterBanks(String query) {
    setState(() {
      filteredBanks = dropDownArry.where((bank) {
        final name = bank.name!.toLowerCase();
        final searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();
      if (_selectedBank != null && !filteredBanks.contains(_selectedBank)) {
        _selectedBank = null; // Clear selected bank if not in the filtered list
      }
    });
  }
}
