// ignore_for_file: non_constant_identifier_names, duplicate_ignore, prefer_const_constructors, prefer_is_empty, avoid_print, sized_box_for_whitespace, camel_case_types

import 'dart:async';
import 'dart:convert';

// import 'package:bype_techno_projects1/Json_model/baner_model.dart';
// import 'package:bype_techno_projects1/globale_class.dart';
// import 'package:bype_techno_projects1/homnave_scree.dart';
// import 'package:bype_techno_projects1/list_map.dart';
// import 'package:bype_techno_projects1/splesh_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Json_model/baner_model.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/homnave_scree.dart';
import 'package:paytm_project_sonitecno2/list_map.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate_screen extends StatefulWidget {
  const Authenticate_screen({super.key});

  @override
  State<Authenticate_screen> createState() => _Authenticate_screenState();
}

class _Authenticate_screenState extends State<Authenticate_screen> {
  // ignore: non_constant_identifier_names
  List<BannerListData> banners = [];
  var Pin = true;
  bool _isLoading = false;

  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  late Timer _timer;

  int _secondsRemaining = 60;
  bool _resendButtonEnabled = false;
  @override
  void initState() {
  super.initState();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _resendButtonEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  void resendOTP() {
    // Implement logic to resend OTP
    setState(() {
      _secondsRemaining = 60;
      _resendButtonEnabled = false;
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _doSomething() {
    // Do something
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool agree = false;

    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.075),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/Icics.png",
                    height: 34,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                    height: h * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color.fromARGB(255, 216, 232, 232)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.026),
                        const Text(
                          "Enter digit Login Pin",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              4,
                              (index) => SizedBox(
                                width: 50.0,
                                child: Theme(
                                  data: ThemeData(
                                    primaryColor: const Color.fromARGB(
                                        255, 211, 185, 183),
                                    primaryColorDark: const Color.fromARGB(
                                        255, 230, 195, 195),
                                  ),
                                  child: TextFormField(
                                    controller: controllers[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(11),
                                        borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 213, 195, 195),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 245, 234, 234),
                                      contentPadding: const EdgeInsets.all(0),
                                      counterText: '',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1 && index < 3) {
                                        FocusScope.of(context).nextFocus();
                                      } else if (value.length == 0 &&
                                          index > 0) {
                                        FocusScope.of(context).previousFocus();
                                      }

                                      // Call the function to get the combined value
                                      String combinedValue = getCombinedValue();
                                      print(
                                          'Combined Value:>>>>>>>>>>>>>>>>>>>>>>>>> $combinedValue');
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_resendButtonEnabled)
                                TextButton(
                                  onPressed: () => resendOTP(),
                                  child: const Text('Resend OTP'),
                                )
                              else
                                Text(
                                  'Resend OTP in $_secondsRemaining seconds',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              SizedBox(
                                width: 5,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _submitOTP();
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ]),
                        const Text(
                          "Forgot MPIN?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: w * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) =>
                                      const BorderSide(color: Colors.red),
                                ),
                                checkColor: Colors.red,
                                activeColor: Colors.white,
                                focusNode: FocusNode(canRequestFocus: false),
                                value: Pin,
                                onChanged: (bool? value) {
                                  setState(() {
                                    Pin = true;
                                  });
                                },
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  const Text(
                                    "I have read, understood & accept the",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: h * 0.00),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Terms & Conditions"),
                                              content: StatefulBuilder(
                                                builder: (context, setState) {
                                                  return Container(
                                                    height: h * 0.3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        const SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child: Text(
                                                            "I have read the agrement and I accpet it",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        const Text(
                                                          "I have read the agrement and I accpet it",
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        const Text(
                                                          "I have read the agrement and I accpet it",
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        const Text(
                                                          "I have read the agrement and I accpet it",
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        const Text(
                                                          "I have read the agrement and I accpet it",
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Checkbox(
                                                              activeColor:
                                                                  Colors.red,
                                                              checkColor:
                                                                  Colors.white,
                                                              value: agree,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  agree =
                                                                      value ??
                                                                          false;
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              },
                                                            ),
                                                            ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green),
                                                              onPressed: agree
                                                                  ? _doSomething
                                                                  : null,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Confirm',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Terms and Conditions,Safety Tips",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 255, 94, 0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: h * 0.02,
                ),
                Center(
                  child: !_isLoading
                      ? const Text("")
                      : const CircularProgressIndicator(),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Products at your fingertips",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: h * 0.32,
                  child: GridView.builder(
                      itemCount: ArrayName.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 5 / 6,
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(),
                          child: (Container(
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xffFFFFFF),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(69, 143, 145, 135),
                                    blurRadius: 1,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  ListName[index]["image"],
                                  height: 30,
                                ),
                                Text(
                                  ListName[index]["title"],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )),
                        );
                      }),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: h * 0.15,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: w * 0.012),
                          height: 100,
                          width: w * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 239, 216, 216),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: Image.asset(
                            "assets/images/recarge-removebg-preview (1).png",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ]),
        ),
      ),
    ));
  }

  String? mobile;
  String? password;

  Future<void> _submitOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String? userDataPref = await SharedPreferences.getInstance()
          .then((sp) => sp.getString(SpleshScrrenState.Mobaile));
      String? userDatapassword = await SharedPreferences.getInstance()
          .then((sp) => sp.getString(SpleshScrrenState.Password));

      if (userDataPref != null && userDatapassword != null) {
        String combinedValue = getCombinedValue();
        String? deviceID;

        try {
          deviceID = await MyGlobalFunctions.getId();
          print("API data: $deviceID");
        } catch (error) {
          print('Error getting device ID: $error');
        }

        String requestJson =
            '{"MethodName":"verifyuserinotherphone","UserID":"$userDataPref","Password": "$userDatapassword","LoginPin":"$combinedValue", "AppType": " Apps"  }';
        String? verifyuserinotherphones = await MyGlobalFunctions.PostCall(
          requestJson,
          "$deviceID",
        );
        print("API Response: $verifyuserinotherphones");

        final data = json.decode(verifyuserinotherphones!);
        if (data["statuscode"] == "TXN") {
          
        } else {
          // Handle other cases if needed
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

  void navigateToPaytmTheme() {
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeNaveScreens(
                  index: 0,
                )));
  }

  String getCombinedValue() {
    return controllers.map((controller) => controller.text).join();
  }
}
