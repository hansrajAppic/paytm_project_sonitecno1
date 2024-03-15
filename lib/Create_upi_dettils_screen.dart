// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';


class UpiDetails extends StatefulWidget {
  const UpiDetails({super.key});

  @override
  State<UpiDetails> createState() => _JioRechargeState();
}

class _JioRechargeState extends State<UpiDetails> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        // appBar: AppBar(
        //   backgroundColor: AppColors.redColor,
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        //   title: Text(
        //     "UPI Details",
        //     style: const TextStyle(
        //         color: AppColors.whiteColor,
        //         fontSize: 16,
        //         fontWeight: FontWeight.w500),
        //   ),
        // ),
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
            'UPI Details',
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.01),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "UPI Details",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 219, 193, 193),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Divider(),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "UPI Id",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Name",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "PAN No.",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Category",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Address ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Date",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Status ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w * 0.1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ": wpay.9549324328@icici",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ": Hansraj Yogi",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ": ZXCVB4321 N,",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ":  Retail Stores",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ": Kukas, Rajasthan, 302028",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ": 27 Nov 2023",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ": ACTIVATED",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 212, 186, 186),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      //     SizedBox(
                      //       width: w * 0.1,
                      //     ),
                      //     Text(
                      //       ": wpay.9549324328@icici",
                      //       style: const TextStyle(
                      //           color: Color.fromARGB(255, 212, 186, 186),
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w400),
                      //     ),
                      //   ],
                      // ),

                      // Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "UPI Id",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //       SizedBox(
                      //         width: w * 0.1,
                      //       ),
                      //       Text(
                      //         ": Hansraj Yogi",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //     ]),
                      // Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "PAN No.",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //       SizedBox(
                      //         width: w * 0.1,
                      //       ),
                      //       Text(
                      //         ": ZXCVB4321 N",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //     ]),
                      // Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Category",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //       SizedBox(
                      //         width: w * 0.1,
                      //       ),
                      //       Text(
                      //         ": Retail Stores",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //     ]),
                      // Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Date",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //       SizedBox(
                      //         width: w * 0.1,
                      //       ),
                      //       Text(
                      //         ":  27 Nov 2023",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //     ]),
                      // Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Status",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //       SizedBox(
                      //         width: w * 0.1,
                      //       ),
                      //       Text(
                      //         ": ACTIVATED",
                      //         style: const TextStyle(
                      //             color: Color.fromARGB(255, 212, 186, 186),
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                    ]),
              ]),
        ));
  }
}
