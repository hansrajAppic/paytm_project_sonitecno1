// ignore: file_names
import 'dart:convert';


import 'package:paytm_project_sonitecno2/Json_model/company_logain_details_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/user_logain_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  // ignore: non_constant_identifier_names
  Future<LoginData> getCustomerData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? stringValue = sp.getString('LogainData');

    // Decode the JSON string and create a GetLogainDetails object
    Map<String, dynamic> jsonMap = jsonDecode(stringValue!);
    LoginData user = LoginData.fromJson(jsonMap);
    return user;
  }

  Future<CompanyData> getCompanyData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? stringValue = sp.getString('GetCompanyDetails');

    // Decode the JSON string and create a GetLogainDetails object
    Map<String, dynamic> jsonMap = jsonDecode(stringValue!);
    CompanyData user = CompanyData.fromJson(jsonMap);
    return user;
  }
}
