// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, empty_catches, unused_field, duplicate_ignore, unused_local_variable, use_build_context_synchronously, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, camel_case_types, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, prefer_is_empty

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:paytm_project_sonitecno2/Globale_class/circularProgressIndicator_class.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/getoprater_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/getstate_model.dart';
import 'package:paytm_project_sonitecno2/Json_model/plannew.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/pay_recharge_screen.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanRecharge_Screen extends StatefulWidget {
  final Map<String, String> SearchData;

  const PlanRecharge_Screen({Key? key, required this.SearchData})
      : super(key: key);

  @override
  State<PlanRecharge_Screen> createState() => _PlanRecharge_ScreenState();
}

class _PlanRecharge_ScreenState extends State<PlanRecharge_Screen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<dynamic> TabList = [];

  List<dynamic> planvalidatearry = [];

  // ignore: unused_field
  TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  List<getopraterlist> operatorArray = [];
  List<Banklist> getStateArray = [];
  List<dynamic> PlannewArray = [];
  List<dynamic> flitterdataArray = [];

  bool isLoading = false;

  void filterItems(String query) {
    if (query != "") {
      setState(() {
        flitterdataArray = PlannewArray.where((item) =>
            (item.amount.toString().replaceAll(".0", "") == query)).toList();
        tabController.animateTo(TabList.indexWhere((item) => item
            .toLowerCase()
            .contains(flitterdataArray[0].planTab.toLowerCase())));
      });
    } else {
      setState(() {
        flitterdataArray = PlannewArray;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //tabController = TabController(length: TabList.length, vsync: this);
    apiCall().then((value) {
      if (widget.SearchData["operator"].toString() == "") {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showBottomSheet(context);
        });
      } else {
        widget.SearchData["operatorID"] = operatorArray
            .where((element) =>
                element.operatorName?.toUpperCase() ==
                widget.SearchData["operator"].toString().toUpperCase())
            .first
            .iD
            .toString();
      }
    });

    GetStateApi().then((value) {
      {
        widget.SearchData["stateID"] = getStateArray
            .where((element) =>
                element.statename?.toUpperCase() ==
                widget.SearchData["state"].toString().toUpperCase())
            .first
            .id
            .toString();

        PlannewapiCall(widget.SearchData["operatorID"].toString(),
            widget.SearchData["stateID"].toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:
          //  Center(child: CircularProgressIndicator()) // Show CircularProgressIndicator if loading
          //             :
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 80,
            color: AppColors.PinkColors,
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.whiteColor),
                  ),
                  Builder(builder: (context) {
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Text(
                          "Select a recharge plan",
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }),
                  Spacer(),
                  Icon(
                    Icons.help_outline_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                      height: h * 0.048,
                      width: w * 0.1,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 236, 210, 210)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.monetization_on)),
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
                        fontSize: 12,
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
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter bottomState) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom +
                                            0,
                                        top: 3),
                                    // ignore: sized_box_for_whitespace
                                    child: Container(
                                      height: 500,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.02,
                                            vertical: h * 0.01),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(height: h * 0.043),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: operatorArray.length,
                                              itemBuilder: (
                                                BuildContext context,
                                                int index,
                                              ) {
                                                return InkWell(
                                                  onTap: () {},
                                                  child: ListTile(
                                                    onTap: () {
                                                      _handleItemClick(
                                                          context,
                                                          opData(
                                                              opName: operatorArray[
                                                                      index]
                                                                  .operatorName,
                                                              serviceIDs:
                                                                  operatorArray[
                                                                          index]
                                                                      .serviceID,
                                                              operatorCodes:
                                                                  operatorArray[
                                                                          index]
                                                                      .operatorCode,
                                                              img:
                                                                  operatorArray[
                                                                          index]
                                                                      .img,
                                                              opid:
                                                                  operatorArray[
                                                                          index]
                                                                      .iD));
                                                      // Do something when the item is tapped
                                                    },
                                                    leading: CircleAvatar(
                                                      backgroundColor: AppColors
                                                              .SalmonColorColor
                                                          .withOpacity(0.5),
                                                      radius: 21,
                                                      child: Image.network(
                                                        "https://sonitechno.info/images/icons/${operatorArray[index].img}",
                                                        height: 25,
                                                      ),
                                                    ),
                                                    title: Text(
                                                      operatorArray[index]
                                                          .operatorName
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xFFFF0011),
                                                      ),
                                                    ),
                                                    subtitle: Divider(),
                                                  ),
                                                );
                                              },
                                            )
                                            // ElevatedButton(
                                            //   onPressed: () {
                                            //     // Close the bottom sheet when the button is pressed.
                                            //     Navigator.of(context).pop();
                                            //   },
                                            //   child: Text('Close'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: Container(
                            height: h * 0.036,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.DivaiderblackColor,
                                ),
                                borderRadius: BorderRadius.circular(22)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.SearchData["operator"].toString(),
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
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
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Adjust the radius according to your preference
                                    border: Border.all(
                                      color: Colors
                                          .red, // Specify the color of the border here
                                      width:
                                          2.0, // Specify the width of the border here
                                    ),
                                  ),
                                  child: DraggableScrollableSheet(
                                    initialChildSize: 0.5,
                                    minChildSize: 0.25,
                                    maxChildSize: 0.9,
                                    expand: false,
                                    builder: (BuildContext context,
                                        ScrollController scrollController) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white,
                                        ),
                                        child: ListView.builder(
                                          controller: scrollController,
                                          shrinkWrap: true,
                                          itemCount: getStateArray.length,
                                          itemBuilder: (
                                            BuildContext context,
                                            int index,
                                          ) {
                                            return InkWell(
                                              onTap: () {
                                                // Do something when the item is tapped
                                              },
                                              child: ListTile(
                                                onTap: () {
                                                  _StateItemClick(
                                                      context,
                                                      opDatagetstate(
                                                        statenames:
                                                            getStateArray[index]
                                                                .statename,
                                                        stateIds:
                                                            getStateArray[index]
                                                                .stateId,
                                                        ids:
                                                            getStateArray[index]
                                                                .id,
                                                      ));
                                                },
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.SalmonColorColor
                                                          .withOpacity(0.5),
                                                  radius: 21,
                                                  child: Icon(Icons
                                                      .nest_cam_wired_stand),
                                                  // child: Image.network(
                                                  //   "https://sonitechno.info/images/icons/${operatorArray[index].img}",
                                                  //   height: 25,
                                                  // ),
                                                ),
                                                title: Text(
                                                  getStateArray[index]
                                                      .statename
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFFFF0011),
                                                  ),
                                                ),
                                                subtitle: Divider(),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: h * 0.036,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.DivaiderblackColor,
                                ),
                                borderRadius: BorderRadius.circular(22)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.SearchData["state"].toString(),
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
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
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.DivaiderblackColor,
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                TextFormField(
                  onSaved: (val) {},
                  onChanged: (value) {
                    filterItems(value);
                  },
                  // controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.fromLTRB(13, 12, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 146, 152)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 140, 124, 130)),
                      ),
                      labelText: 'Search for a plan, eg 249 or 28 days',
                      hintText: 'Search for a plan, eg 249 or 28 days',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      )),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          GlobalCircularProgressIndicator(
            isLoading: isLoading,
          ),

          TabBar(
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.red,
            tabs: [
              // Dynamically build TabBar tabs based on the length of the TabController
              for (int i = 0; i < (TabList.length); i++)
                Tab(
                  child: Text("${TabList[i]}"),
                ),
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                TabList.length,
                (indexss) =>
                    // child: Text(" ${TabList[index]}"),
                    Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: flitterdataArray
                              .where((plan) => plan.planTab == TabList[indexss])
                              .toList()
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = flitterdataArray
                                .where(
                                    (plan) => plan.planTab == TabList[indexss])
                                .toList()[index];
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.01),
                              child: InkWell(
                                onTap: () {
                                  widget.SearchData["RechargeAmunt"] =
                                      item.amount.toString();

                                  widget.SearchData["planDescription"] =
                                      item.planDescription.toString();

                                  widget.SearchData["validity"] =
                                      item.validity.toString();

                                  planvalidateApi(
                                      widget.SearchData["operatorID"]
                                          .toString(),
                                      widget.SearchData["stateID"].toString(),
                                      widget.SearchData["Phone"].toString(),
                                      item.amount.toString());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(69, 143, 145, 135),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.orangeAccent,
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02,
                                                    vertical: h * 0.002),
                                                child: Text(
                                                  item.dataBenefit.toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 17,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '₹${item.amount.toString()}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            SizedBox(
                                              height: 30,
                                              child: VerticalDivider(
                                                color: Colors.black,
                                                thickness: 1,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Data"),
                                                Text(
                                                  item.dataBenefit.toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Validity",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black54),
                                                ),
                                                Text(
                                                  item.validity.toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(height: 25),
                                        Text(
                                          item.planDescription.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Expanded(
          //   child: TabBarView(
          //     controller: tabController,
          //     children: [
          //       JioRecharge(),
          //       const Center(child: Text('Screen 3')),
          //       const Center(child: Text('Screen 4')),
          //     ],
          //   ),
          // ),
          // TabBar(
          //   unselectedLabelColor: Colors.black,
          //   isScrollable: true,
          //   labelColor: Colors.red,
          //   tabs: [
          //     const Tab(text: 'BEST SELLING PACKS '),
          //     const Tab(text: 'Data:Top Pick'),
          //     const Tab(text: 'YEARLY PLANS'),
          //   ],
          //   controller: tabController,
          //   indicatorSize: TabBarIndicatorSize.tab,
          // ),

          // Expanded(
          //   child: TabBarView(
          //     controller: tabController,
          //     children: [
          //       TabBarView(children: [
          //         JioRecharge(),
          //         const Center(child: Text('Screen 3')),
          //         const Center(child: Text('Screen 4')),
          //       ])
          //     ],
          //   ),
          // ),

          // TabBar(
          //   unselectedLabelColor: Colors.black,
          //   isScrollable: true,
          //   labelColor: Colors.red,
          //   tabs: List.generate(
          //     TabList!.length,
          //     (index) => Tab(
          //       child: Text("${TabList![index]}"),
          //     ),
          //   ),
          //   controller: tabController,
          //   indicatorSize: TabBarIndicatorSize.tjab,
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _showBottomSheet(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter bottomState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 0, top: 3),
            // ignore: sized_box_for_whitespace
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(22)),
              height: 500,
              width: double.infinity,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 0.02, vertical: h * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: h * 0.043,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: operatorArray.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return InkWell(
                          onTap: () {},
                          child: ListTile(
                            onTap: () {
                              _handleItemClick(
                                  context,
                                  opData(
                                      opName: operatorArray[index].operatorName,
                                      serviceIDs:
                                          operatorArray[index].serviceID,
                                      operatorCodes:
                                          operatorArray[index].operatorCode,
                                      img: operatorArray[index].img,
                                      opid: operatorArray[index].iD));
                              // Do something when the item is tapped
                            },
                            leading: CircleAvatar(
                              backgroundColor:
                                  AppColors.SalmonColorColor.withOpacity(0.5),
                              radius: 21,
                              child: Image.network(
                                "https://sonitechno.info/images/icons/${operatorArray[index].img}",
                                height: 25,
                              ),
                            ),
                            title: Text(
                              operatorArray[index].operatorName.toString(),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFF0011),
                              ),
                            ),
                            subtitle: Divider(),
                          ),
                        );
                      },
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Close the bottom sheet when the button is pressed.
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Text('Close'),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  void _showBottomSheetstate(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                20.0), // Adjust the radius according to your preference
            border: Border.all(
              color: Colors.red, // Specify the color of the border here
              width: 2.0, // Specify the width of the border here
            ),
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.25,
            maxChildSize: 0.9,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: getStateArray.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return InkWell(
                      onTap: () {
                        // Do something when the item is tapped
                      },
                      child: ListTile(
                        onTap: () {
                          _StateItemClick(
                              context,
                              opDatagetstate(
                                statenames: getStateArray[index].statename,
                                stateIds: getStateArray[index].stateId,
                                ids: getStateArray[index].id,
                              ));
                        },
                        leading: CircleAvatar(
                          backgroundColor:
                              AppColors.SalmonColorColor.withOpacity(0.5),
                          radius: 21,
                          child: Icon(Icons.nest_cam_wired_stand),
                          // child: Image.network(
                          //   "https://sonitechno.info/images/icons/${operatorArray[index].img}",
                          //   height: 25,
                          // ),
                        ),
                        title: Text(
                          getStateArray[index].statename.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF0011),
                          ),
                        ),
                        subtitle: Divider(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

// Tabbarvew
  Future<void> PlannewapiCall(String op, String st) async {
    try {
      setState(() {
        isLoading = true;
      });

      SharedPreferences sp = await SharedPreferences.getInstance();
      String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      String? userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null && userDatapassword != null) {
        String? deviceID = "";

        try {
          String? result = await MyGlobalFunctions.getId();
          deviceID = result;
        } catch (error) {}

        String? plannew = await MyGlobalFunctions.PostCall(
          '{"MethodName":"plannew","UserID":"$userDataPref","Password":"$userDatapassword","OperatorID":"$op","State":"$st"}',
          "$deviceID",
        );

        final data = json.decode(plannew!);
        if (data["success"].toString() == "true") {
          //var jsonList = json.decode(plannew)['data'];
          List<dynamic> operatorsList = data["data"]["plans"]
              .map((json) => Plans.fromJson(json))
              .toList();
          //TabList
          List<dynamic>? planTabs = data["data"]["plans"]
              .map((item) => item["planTab"] ?? "")
              .toList();

          setState(() {
            isLoading = false;
            PlannewArray = operatorsList;
            flitterdataArray = operatorsList;
            TabList = planTabs!.toSet().toList();

            // Dispose of the existing TabController

            tabController = TabController(length: TabList.length, vsync: this);
          });
        } else {
          if (data["status"].toString() == "UnAuthorized Person") {
            MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
          }
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (ex) {
      setState(() {
        isLoading = false;
      });
    }
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
      } catch (error) {}
      String? getOperators = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getoperators","UserID":"$userDataPref","Password":"$userDatapassword","AppType": " Apps","ServiceTypeID":"1"}',
        "$deviceID",
      );

      final data = json.decode(getOperators!);
      if (data["statuscode"] == "TXN") {
        List<dynamic> jsonList = json.decode(getOperators)['data'];
        List<getopraterlist> operatorsList =
            jsonList.map((json) => getopraterlist.fromJson(json)).toList();

        setState(() {
          operatorArray = operatorsList;
        });
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          // ignore: use_build_context_synchronously
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
        // setState(() {
        //   isLoading = false;
        // });
      }
    }
  }

  //  Plan  Array api
  Future<void> planvalidateApi(
      String op, String st, String mo, String amou) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
    String? userDatapassword = sp.getString(SpleshScrrenState.Password);

    if (userDataPref != null && userDatapassword != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {}
      String? getOperators = await MyGlobalFunctions.PostCall(
        '{"MethodName":"planvalidate", "OPID" :"$op", "CircleID":"$st", "Mobile": "$mo","Amount": "$amou", "UserID":"$userDataPref","Password":"$userDatapassword","AppType": " Apps"}',
        "$deviceID",
      );

      final data = json.decode(getOperators!);
      if (data["code"] == "TXN") {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PayRecharge_Screen(SearchData: widget.SearchData)));
      } else {
        // ignore: use_build_context_synchronously
        MyGlobalFunctions.errorMessage(context, data["mess"].toString());
      }

      setState(() {
        isLoading = false;
      });
    }
  }

// // state

  Future<void> GetStateApi() async {
    try {
      // Fetch data from SharedPreferences
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      String? userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null && userDatapassword != null) {
        String? deviceID = await MyGlobalFunctions.getId();

        String? getOperators = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getcircles","UserID":"$userDataPref","Password":"$userDatapassword","AppType": " Apps","ServiceTypeID":"1"}',
          "$deviceID",
        );

        final data = json.decode(getOperators!);
        if (data["statuscode"] == "TXN") {
          List<dynamic> jsonList = data['data'];
          List<Banklist> operatorsList =
              jsonList.map((json) => Banklist.fromJson(json)).toList();
          setState(() {
            getStateArray = operatorsList;
          });
        } else {
          if (data["status"].toString() == "UnAuthorized Person") {
            MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
            // Close the app
          }
        }
      }
    } catch (error) {
      // Handle error
    }
  }

  void _handleItemClick(BuildContext context, opData selectedItem) {
    opData oh = selectedItem;

    setState(() {
      widget.SearchData["operator"] = oh.opName!;
      widget.SearchData["operatorID"] = oh.opid.toString();
    });
    Navigator.pop(context);
    if (widget.SearchData["state"].toString() == "") {
      _showBottomSheetstate(context);
    } else {}

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => RechargeMobaile(data: oh),
    //   ),
    // );
  }

  void _StateItemClick(BuildContext context, opDatagetstate selectedItem) {
    opDatagetstate state = selectedItem;

    setState(() {
      widget.SearchData["state"] = state.statenames!;
      widget.SearchData["StateID"] = state.ids.toString();
    });
    Navigator.pop(context);

    PlannewapiCall(widget.SearchData["operatorID"].toString(),
        widget.SearchData["StateID"].toString());
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

class opDatagetstate {
  final String? statenames;
  final int? stateIds;
  final int? ids;

  opDatagetstate({
    required this.statenames,
    required this.stateIds,
    required this.ids,
  });
}

class RechargeMobailes extends StatefulWidget {
  final opDatagetstate data;

  RechargeMobailes({required this.data});

  @override
  State<RechargeMobailes> createState() => _REchargeMobailesState();
}

class _REchargeMobailesState extends State<RechargeMobailes> {
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
    opDatagetstate hys = widget.data;

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
                    "${hys.statenames}",
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
                "${widget.data.statenames}",
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
