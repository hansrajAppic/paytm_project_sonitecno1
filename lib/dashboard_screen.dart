// ignore_for_file: file_names, unused_field, avoid_print, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, camel_case_types, non_constant_identifier_names, unnecessary_new, unused_element, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/baner_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/company_logain_details_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/paytm_home_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/user_logain_details_model.dart';
import 'package:paytm_project_sonitecno2/bbps_screen.dart';
import 'package:paytm_project_sonitecno2/change_pasword.dart';
import 'package:paytm_project_sonitecno2/change_pinscreen.dart';
import 'package:paytm_project_sonitecno2/dth_screen.dart';
import 'package:paytm_project_sonitecno2/fund_trensfer_screen.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/login_screen.dart';
import 'package:paytm_project_sonitecno2/my_profaile_screen.dart';
import 'package:paytm_project_sonitecno2/news_screen.dart';
import 'package:paytm_project_sonitecno2/search_contactslist_screen.dart';
import 'package:paytm_project_sonitecno2/search_paytm.dart';
import 'package:paytm_project_sonitecno2/setting_screen.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:paytm_project_sonitecno2/upitransfer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Globale_class/Global.dart';

class DashBord_Screen extends StatefulWidget {
  // final Profile_succfuly data;

  // DashBord_Screen({required this.data});

  @override
  State<DashBord_Screen> createState() => _DashBord_ScreenState();
}

class _DashBord_ScreenState extends State<DashBord_Screen> {
  bool isLoading = true;
  ScrollController ctrl1 = ScrollController();
  ScrollController ctrl2 = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  bool isCtrl1Scroll = true;
  File? _profileImage;

  // ignore: prefer_typing_uninitialized_variables
  var sp;
  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  Global globalInstance = Global();
  //  Future<String?> deviceIDs = MyGlobalFunctions.getId();
  List<BannerListData> banners = [];
  List<LisrData> bannersArray = [];
  // ignore: avoid_init_to_null
  CompanyData? companyData = null;
  LoginData? getCustomerDat = null;

  @override
  void initState() {
    ctrl1.addListener(_ctrl1Listner);
    ctrl2.addListener(_ctrl2Listner);

    super.initState();
    apiCall().then((value) {});
    fetchData();
    AssignCustonerData();

    //loginData

    //   bannersArray = DashboardApi.fetchData()as List<Data>;
    // }}
  }

  void AssignCustonerData() async {
    companyData = await globalInstance.getCompanyData();
    // LoginData = await globalInstance.getCompanyData();
  }

  void startAutoScroll() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScrollPosition = _scrollController.position.pixels;
        if (currentScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            currentScrollPosition + 100.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  double? _imageWidth;
  double? _imageHeight;
  @override
  void dispose() {
    ctrl1.removeListener(_ctrl1Listner);
    ctrl2.removeListener(_ctrl2Listner);
    ctrl1.dispose();
    ctrl2.dispose();
    super.dispose();
    _scrollController.dispose();
  }

  void _ctrl1Listner() {
    if (ctrl1.position.atEdge) {
      bool isTop = ctrl1.position.pixels == 0;
      if (isTop) {
        print('page_At the top');
      } else {
        setState(() {
          isCtrl1Scroll = false;
        });
        print('page_At the bottom');
      }
    }
  }

  void _ctrl2Listner() {
    if (ctrl2.position.atEdge) {
      bool isTop = ctrl2.position.pixels == 0;
      if (isTop) {
        setState(() {
          isCtrl1Scroll = true;
        });
        print('page_At the top::::::::::::ctrl2');
      } else {
        print('page_At the bottom:::::::::::ctrl2');
      }
    }
  }

  // loadData() async {
  //   var sharedPrefe = await SharedPreferences.getInstance();

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // Profile_succfuly items = widget.data;

    return Scaffold(
      backgroundColor: const Color(0xff022A72),
      drawer: Row(
        children: [
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.orange,
                          Colors.red,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(39),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchScreen()));
                          },
                          child: SizedBox(
                            width: 130,
                            height: 130,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : null,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: _pickProfileImage,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade400,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt_sharp,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  Text('User ID: $userId'),
                                // Text('User ID: $'),
                                //  Text('Role ID: $roleId'),
                                // Text(
                                //   "Corporate Id",
                                //   style: TextStyle(
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w500,
                                //       color: Colors.white),
                                // ),

                                // Text(
                                //   'Corporate Id: ${items.roleId}', // Corrected: removed unnecessary quotation marks and comma
                                //   style: TextStyle(
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.white,
                                //   ),
                                // ),

                                Text(
                                  "573303418",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                // Text(
                                //   'User ID: ${items.userid}', // Corrected: removed unnecessary quotation
                                //   style: TextStyle(
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                Text(
                                  "USER 1",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // ListTile(
                //   leading: const Icon(Icons.person),
                //   title: const Text("My Profile"),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("My Profile"),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile_Screen()),
                    );
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Change your Login ID"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePinScreen()));
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.arrow_back_ios_new_sharp),
                  title: const Text("Change your password"),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChangePasswordChangeScreen()));
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Setting_Screen()));
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.star_border),
                  title: const Text("Rat Us "),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.shop),
                  title: const Text("FAQs"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text("Isafe"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_callback_rounded),
                  title: const Text("Contact Us"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.bookmark_outline_outlined),
                  title: const Text("Feedback"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text("Logout"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              insetPadding: const EdgeInsets.symmetric(
                                horizontal: 50.0,
                                vertical: 10.0,
                              ),
                              title: const Text(
                                "are you sure? you want to Close Applications",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              Navigator.of(context).pop(true);
                                            });
                                            return const AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 120.0,
                                                vertical: 146.0,
                                              ),
                                              title: Text(
                                                "No Thanks",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            );
                                          });
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.08,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      SharedPreferences sp =
                                          await SharedPreferences.getInstance();

                                      sp.clear();

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Logain_screen()));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Color(0xffFFCDD2),
                                            content: Text(
                                              "Yes Logout",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      );
                                    },
                                    child: const Text(
                                      "yes",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                ],
                              ));
                        });
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff022A72),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_2,
                  color: Color.fromARGB(255, 158, 183, 204),
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Row(
          children: [
            // Text(" ${companyData?.data?[0].address}"),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(
                "https://sonitechno.info/images/Company/${companyData?.data?[0].logo}",
                height: 200,
                width: 170,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewsScreenss(),
                  ),
                );
              },
              icon: const Icon(
                Icons.messenger_outline,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              // Handle the onTap action for the messenger icon
            },
            child: const Icon(
              Icons.notification_add,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              physics: isCtrl1Scroll
                  ? const ClampingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              controller: ctrl1,
              child: Column(
                children: [
                  const SizedBox(height: 180),
                  Container(
                    height: MediaQuery.of(context).size.longestSide - 100,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 242, 247, 251),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SingleChildScrollView(
                          physics: isCtrl1Scroll
                              ? const NeverScrollableScrollPhysics()
                              : const ClampingScrollPhysics(),
                          controller: ctrl2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18),
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  viewportFraction: 1.0,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlay: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                ),
                                itemCount: banners.length,
                                itemBuilder: (context, index, realIndex) {
                                  // setState(() {

                                  var makeFullUrl =
                                      "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

                                  return SizedBox(
                                    child: SizedBox(
                                        child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: w * 0.01),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: const Color(0xffFFFFFF),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  137, 134, 128, 128)),
                                          boxShadow: [
                                            const BoxShadow(
                                              color: Color.fromARGB(
                                                  69, 143, 145, 135),
                                              blurRadius: 4,
                                            ),
                                          ]),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Image.network(
                                              width: double.infinity,
                                              height: 180,
                                              makeFullUrl)),
                                    )),
                                  );
                                },
                              ),
                              DotsIndicator(
                                dotsCount: banners.length,
                                position: currentIndex,
                                decorator: DotsDecorator(
                                  color: Colors.grey, // Inactive dot color
                                  activeColor: Colors.blue, // Active dot color
                                  size: const Size.square(8.0), // Dot size
                                  activeSize:
                                      const Size(20.0, 8.0), // Active dot size
                                  spacing: const EdgeInsets.all(
                                      4.0), // Spacing between dots
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Change the active dot shape
                                  ),
                                ),
                              ),
                              buildListView(),
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       top: h * 0.75, left: w * 0.23, bottom: 5),
                        //   child: SizedBox(
                        //     height: h * 0.09,
                        //     width: w * 0.49,
                        //     child: Align(
                        //       alignment: Alignment.center,
                        //       child: ElevatedButton(
                        //           onPressed: () {},
                        //           style: ElevatedButton.styleFrom(
                        //               backgroundColor: const Color.fromARGB(
                        //                   255, 12, 80, 152)),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               SizedBox(
                        //                 width: w * 0.02,
                        //               ),
                        //               const Center(
                        //                 child: Text(
                        //                   "Scan Any Qr",
                        //                   style: TextStyle(
                        //                       fontSize: 17,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: Colors.white),
                        //                 ),
                        //               )
                        //             ],
                        //           )),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<BannerHome?> apiCall() async {
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
        '{"MethodName":"getbanner","UserID":"$userDataPref","Password":"$userDatapassword", "AppType": " Apps"  }',
        "$deviceID",
      );

      final data = json.decode(getbanner!);
      if (data["statuscode"] == "TXN") {
        List<dynamic> jsonList = json.decode(getbanner)['data'];
        List<BannerListData> getBanner =
            jsonList.map((json) => BannerListData.fromJson(json)).toList();
        banners = getBanner;
        setState(() {
          print(banners.length);
        });
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    }
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
          MaterialPageRoute(builder: (context) => Serch_contacts_Screen()),
        );
      } else if (data["ID"].toString() == "3") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dth_Screen()),
        );
      } else if (data["ID"].toString() == "28") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FundTransferScreen()),
        );
      } else if (data["ID"].toString() == "20") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UpiTransferScreen()),
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
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void _BbpsItemClickon(BuildContext context, String selectedItem) {
    late String ServiceName = selectedItem;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Bbps_screen(ServiceName: selectedItem),
      ),
    );
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        const CircularProgressIndicator(),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
