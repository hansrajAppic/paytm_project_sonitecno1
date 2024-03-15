// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: w * 0.04,
        // leading: Icon(Icons.arrow_back),

        toolbarHeight: 100,
        title: Column(children: [
          Center(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  hintText: "Search For",
                  hintStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 31,
                    color: Color.fromARGB(255, 174, 162, 162),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      size: 16,
                    ),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchText = "";
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 206, 197, 197)),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 183, 169, 169))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 126, 114, 114),
                  ))),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: h * 0.33,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 211, 193, 193)),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Popular Services",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/bhank-removebg-preview.png",
                                      height: 30,
                                    ),
                                    const Text(
                                      "Paytm Bank",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.03),
                                          child: Image.asset(
                                            "assets/images/scorce-removebg-preview.png",
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Credit Scorce",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: Image.asset(
                                        "assets/images/download.png",
                                        height: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.006,
                                    ),
                                    const Text(
                                      "Blance &\nHistory",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/ondc-removebg-preview.png",
                                      height: 30,
                                    ),
                                    const Text(
                                      "ONDC-Food",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/mobail.jpeg",
                                      height: 30,
                                    ),
                                    const Text(
                                      "Kyc Near\nPoint",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      "assets/images/open box.png",
                                      height: 30,
                                    ),
                                    const Text(
                                      "Movie\nTickets",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/caridet-removebg-preview.png",
                                      height: 30,
                                    ),
                                    const Text(
                                      "Fastag\nRecarge",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset(
                                        "assets/images/download.png",
                                        height: 30,
                                      ),
                                    ),
                                    const Text(
                                      "Paytm\nPostpaid",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ]),
                        ]))
              ]),
        ),
      ),
    );
  }
}
