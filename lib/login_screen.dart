// ignore_for_file: camel_case_types, library_private_types_in_public_api, non_constant_identifier_names, unused_field, avoid_print, unused_local_variable, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Json_model/baner_model.dart';
import 'package:paytm_project_sonitecno2/authenticate_screen.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/homnave_scree.dart';
import 'package:paytm_project_sonitecno2/my_signup_rgister.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logain_screen extends StatefulWidget {
  const Logain_screen({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<Logain_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController RestpasswordController = TextEditingController();
  TextEditingController Rest1passwordController = TextEditingController();

  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final String _password = '';
  bool _isVisible = false;
  bool _isVisible1 = false;

  dynamic SignUpResponse = [];

  final TextEditingController _phoneNumberController = TextEditingController();
  List<BannerListData> banners = [];

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length > 15) {
      return 'Password must be at least 15 characters';
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

  // static const String KEYLOGIN = "Login";

  String? deviceID = '';
  String? results = '';

  Future<void> PostmodalApi() async {
    setState(() {
      _isLoading = true;
    });

    try {
      deviceID = await MyGlobalFunctions.getId();
    } catch (error) {
      print('Error getting device ID: $error');
    }

    String requestBody =
        '{"MethodName":"getlogindetails","UserID":"${mobileController.text}","Password":"${passwordController.text}", "AppType": " Apps"  }';

    try {
      String? ff = await MyGlobalFunctions.PostCall(requestBody, deviceID);
      final data = json.decode(ff!);
      Map<String, dynamic> userJson = json.decode(ff);

      SharedPreferences sp = await SharedPreferences.getInstance();

      await sp.setString(SpleshScrrenState.LoginData, ff);

      if (data["statuscode"] == "TXN") {
        showSnackBar(data["status"].toString());
        setLoginSharedPreferences(ff);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeNaveScreens(
                      index: 0,
                    )));
      } else {
        setLoginSharedPreferences(ff);
        if (data["status"].toString() == "UnAuthorized Person") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Authenticate_screen()));
        } else {
          // showSnackBar(data["status"].toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              data["status"].toString(),
              style: const TextStyle(fontSize: 10),
            )),
          );
        }
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  void setLoginSharedPreferences(String ff) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(SpleshScrrenState.KEYLOGIN, true);
    await sp.setString(SpleshScrrenState.Mobaile, mobileController.text);
    await sp.setString(SpleshScrrenState.Password, passwordController.text);
    await sp.setString("LoginData", ff);
  }

  Future<void> GetCompanyData() async {
    String? deviceID = await MyGlobalFunctions.getId();

    String requestBody =
        '{"MethodName":"getcompanydetails", "AppType": " Apps"  }';

    try {
      String? ff = await MyGlobalFunctions.PostCall(requestBody, deviceID);
      final data = json.decode(ff!);
      Map<String, dynamic> companyJSON = json.decode(ff);

      SharedPreferences sp = await SharedPreferences.getInstance();

      await sp.setString("GetCompanyDetails", ff);

      if (data["statuscode"] == "TXN") {
      } else if (data["status"] != null) {}
    } catch (error) {
      print('Error: $error');
    } finally {}
  }

  @override
  initState() {
    super.initState();
    GetCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login (1).png"),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Stack(
                children: [
                  Container(),
                  Container(
                    padding: const EdgeInsets.only(left: 35, top: 130),
                    child: const Text(
                      'Welcome\nBack',
                      style: TextStyle(color: Colors.white, fontSize: 33),
                    ),
                  ),
                  SingleChildScrollView(
                    controller: ScrollController(),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 27, right: 35),
                            child: Column(
                              children: [
                                Center(
                                  child: !_isLoading
                                      ? const Text("")
                                      : const CircularProgressIndicator(),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  // controller: mobileController,
                                  controller: mobileController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      // suffixIcon: const Icon(
                                      //   Icons.phone_callback,
                                      //   color: Colors.blue,
                                      // ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible1 = !_isVisible1;
                                          });
                                        },
                                        icon: _isVisible1
                                            ? const Icon(
                                                Icons.phone_callback,
                                                color: Colors.blue,
                                              )
                                            : const Icon(
                                                Icons.phone_callback,
                                                color: Color.fromARGB(
                                                    255, 107, 164, 126),
                                              ),
                                      ),
                                      isCollapsed: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10, 15, 0, 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 164, 146, 152)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 140, 124, 130)),
                                      ),
                                      labelText: 'Phone Number',
                                      hintText: 'Enter a 10-digit phone number',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      )),
                                  validator: _validateMobail,
                                  obscureText: _isVisible1,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: _validatePassword,
                                  // inputFormatters: [
                                  //   LengthLimitingTextInputFormatter(20),
                                  // ],
                                  obscureText: !_isVisible,
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10, 15, 0, 15),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                      ),
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(22))),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyRegister()));
                                      },
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: const Color(0xff4c505b),
                                      child: IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            _submitForm();

                                            if (_formKey.currentState!
                                                .validate()) {}
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward,
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, 'register');
                                      },
                                      // ignore: sort_child_properties_last
                                      child: const Text(
                                        'Sign Up',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xff4c505b),
                                            fontSize: 18),
                                      ),
                                      style: const ButtonStyle(),
                                    ),
                                    // TextButton(
                                    //     onPressed: () {
                                    //       PostmodalApi();
                                    //     },
                                    //     child: Text("data")),

                                    TextButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter bottomState) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                                  .viewInsets
                                                                  .bottom +
                                                              0,
                                                      top: 9),
                                                  child: SizedBox(
                                                    height: h * 0.54,
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical:
                                                                  h * 0.04),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          const Text(
                                                            ' Forgot password',
                                                            style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: h * 0.03,
                                                          ),
                                                          const Text(
                                                            "Enter Your mobile for the verifaction proccess",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          const Text(
                                                            "we will send 4 digets code to your",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: h * 0.037,
                                                          ),
                                                          const Text(
                                                            "Mobile",
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: h * 0.024,
                                                          ),
                                                          TextFormField(
                                                            obscureText:
                                                                _passwordVisible,
                                                            controller:
                                                                mobileController,
                                                            decoration:
                                                                InputDecoration(
                                                              isCollapsed: true,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      15,
                                                                      0,
                                                                      15),
                                                              hintText:
                                                                  "Mobile",
                                                              hintStyle: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              suffixIcon:
                                                                  IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        // Based on passwordVisible state choose the icon
                                                                        _passwordVisible
                                                                            ? Icons.visibility
                                                                            : Icons.visibility_off,
                                                                        color: Theme.of(context)
                                                                            .primaryColorDark,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                                        // setState(() {
                                                                        //   _passwordVisible =
                                                                        //       !_passwordVisible;
                                                                        // });

                                                                        bottomState(
                                                                            () {
                                                                          _passwordVisible =
                                                                              !_passwordVisible;
                                                                        });
                                                                      }),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            11),
                                                              ),
                                                            ),
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'Please enter check password';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                          SizedBox(
                                                            height: h * 0.043,
                                                          ),
                                                          SizedBox(
                                                              height: h * 0.065,
                                                              width: double
                                                                  .infinity,
                                                              child: TextButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(22)),
                                                                    primary: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        99,
                                                                        194,
                                                                        103),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return Padding(
                                                                            padding:
                                                                                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 0, top: 0),
                                                                            child:
                                                                                (SizedBox(
                                                                              height: h * 0.54,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                                                                                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                  const Text(
                                                                                    "Enter 4 Digits Code",
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: h * 0.04,
                                                                                  ),
                                                                                  const Text(
                                                                                    "Enter 4  the Digits Code that you received on/n your mobile",
                                                                                    style: TextStyle(
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: h * 0.04,
                                                                                  ),
                                                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                    SizedBox(
                                                                                        height: 48,
                                                                                        width: 40,
                                                                                        child: TextField(
                                                                                          textAlign: TextAlign.center,
                                                                                          keyboardType: TextInputType.number,
                                                                                          maxLength: 1,
                                                                                          cursorColor: Theme.of(context).primaryColor,
                                                                                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                          onChanged: (value) {
                                                                                            if (value.length == 1) {
                                                                                              FocusScope.of(context).nextFocus();
                                                                                            }
                                                                                          },
                                                                                        )),
                                                                                    SizedBox(
                                                                                        height: 48,
                                                                                        width: 40,
                                                                                        child: TextField(
                                                                                          textAlign: TextAlign.center,
                                                                                          keyboardType: TextInputType.number,
                                                                                          maxLength: 1,
                                                                                          cursorColor: Theme.of(context).primaryColor,
                                                                                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                          onChanged: (value) {
                                                                                            if (value.length == 1) {
                                                                                              FocusScope.of(context).nextFocus();
                                                                                            }
                                                                                          },
                                                                                        )),
                                                                                    SizedBox(
                                                                                        height: 48,
                                                                                        width: 40,
                                                                                        child: TextField(
                                                                                          textAlign: TextAlign.center,
                                                                                          keyboardType: TextInputType.number,
                                                                                          maxLength: 1,
                                                                                          cursorColor: Theme.of(context).primaryColor,
                                                                                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                          onChanged: (value) {
                                                                                            if (value.length == 1) {
                                                                                              FocusScope.of(context).nextFocus();
                                                                                            }
                                                                                          },
                                                                                        )),
                                                                                    SizedBox(
                                                                                        height: 48,
                                                                                        width: 40,
                                                                                        child: TextField(
                                                                                          textAlign: TextAlign.center,
                                                                                          keyboardType: TextInputType.number,
                                                                                          maxLength: 1,
                                                                                          cursorColor: Theme.of(context).primaryColor,
                                                                                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                          onChanged: (value) {
                                                                                            if (value.length == 1) {
                                                                                              FocusScope.of(context).nextFocus();
                                                                                            }
                                                                                          },
                                                                                        )),
                                                                                  ]),
                                                                                  SizedBox(
                                                                                    height: h * 0.04,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                                                                    child: SizedBox(
                                                                                        height: 52,
                                                                                        width: 335,
                                                                                        child: TextButton(
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                            primary: Colors.green,
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pop();
                                                                                            const SizedBox(
                                                                                              height: 200,
                                                                                            );

                                                                                            showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return StatefulBuilder(builder: (BuildContext context, StateSetter bottomState) {
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom - 0, top: 9),
                                                                                                      child: Container(
                                                                                                        height: h * 0.55,
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                                                                                          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                                            const Text(
                                                                                                              "Rest Password",
                                                                                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: h * 0.02,
                                                                                                            ),
                                                                                                            const Text(
                                                                                                              " Set the new password four your accounts so\n you can login and access all the features",
                                                                                                              style: TextStyle(
                                                                                                                fontSize: 15,
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: h * 0.04,
                                                                                                            ),
                                                                                                            TextFormField(
                                                                                                              obscureText: _passwordVisible,
                                                                                                              controller: RestpasswordController,
                                                                                                              decoration: InputDecoration(
                                                                                                                isCollapsed: true,
                                                                                                                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                                                                                                                labelText: "Password",
                                                                                                                hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                                                suffixIcon: IconButton(
                                                                                                                    icon: Icon(
                                                                                                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                                      color: Theme.of(context).primaryColorDark,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      bottomState(() {
                                                                                                                        _passwordVisible = !_passwordVisible;
                                                                                                                      });
                                                                                                                    }),
                                                                                                                border: OutlineInputBorder(
                                                                                                                  borderRadius: BorderRadius.circular(22),
                                                                                                                ),
                                                                                                              ),
                                                                                                              validator: (value) {
                                                                                                                if (value!.isEmpty) {
                                                                                                                  return 'Please enter check password';
                                                                                                                }
                                                                                                                return null;
                                                                                                              },
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: h * 0.04,
                                                                                                            ),
                                                                                                            TextFormField(
                                                                                                              obscureText: _passwordVisible,
                                                                                                              controller: Rest1passwordController,
                                                                                                              decoration: InputDecoration(
                                                                                                                isCollapsed: true,
                                                                                                                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                                                                                                                labelText: "Password",
                                                                                                                hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                                                suffixIcon: IconButton(
                                                                                                                    icon: Icon(
                                                                                                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                                      color: Theme.of(context).primaryColorDark,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      bottomState(() {
                                                                                                                        _passwordVisible = !_passwordVisible;
                                                                                                                      });
                                                                                                                    }),
                                                                                                                border: OutlineInputBorder(
                                                                                                                  borderRadius: BorderRadius.circular(22),
                                                                                                                ),
                                                                                                              ),
                                                                                                              validator: (value) {
                                                                                                                if (value!.isEmpty) {
                                                                                                                  return 'Please enter check password';
                                                                                                                }
                                                                                                                return null;
                                                                                                              },
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: h * 0.018,
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsets.symmetric(
                                                                                                                vertical: 20,
                                                                                                              ),
                                                                                                              child: SizedBox(
                                                                                                                  height: 51,
                                                                                                                  width: 335,
                                                                                                                  child: TextButton(
                                                                                                                    style: ElevatedButton.styleFrom(
                                                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                                                                                                                      primary: Colors.green,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      Navigator.of(context).pop();
                                                                                                                    },
                                                                                                                    child: const Text(
                                                                                                                      "Reset Password",
                                                                                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ),
                                                                                                          ]),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  });
                                                                                                });
                                                                                          },
                                                                                          child: const Text(
                                                                                            "Continue",
                                                                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                          ),
                                                                                        )),
                                                                                  ),
                                                                                ]),
                                                                              ),
                                                                            )),
                                                                          );
                                                                        });
                                                                  },
                                                                  child: const Text(
                                                                      "Continue",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white)))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                        child: const Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.green,
                                            decorationColor: Colors.green,
                                            fontSize: 18,
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      PostmodalApi();
    }
  }
}
