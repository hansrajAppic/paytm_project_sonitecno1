// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MassagesScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MassagesScreenState createState() => _MassagesScreenState();
}

class _MassagesScreenState extends State<MassagesScreen> {
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();
  // ignore: unused_field
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

          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Messages",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "New Chat",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 97, 169, 228)),
              )
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Center(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        hintText: "Search For",
                        hintStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 31,
                          color: Color.fromARGB(255, 150, 183, 239),
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
                SizedBox(
                  height: h * 0.31,
                ),
                Center(child: Align(child: CircularProgressIndicator())),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  "No Results found",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  "Thise contact or chat dose not exits",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: h * 0.25, left: w * 0.00, bottom: 20),
                  child: SizedBox(
                    height: h * 0.09,
                    width: w * 0.24,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 12, 80, 152)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/scan-removebg-preview.png",
                                    color: Colors.white,
                                    height: 25,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Scan Qr",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.gif_box_rounded,
                                    color: Colors.white,
                                  ),
                                  Center(
                                    child: Text(
                                      "Scan Qr",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
