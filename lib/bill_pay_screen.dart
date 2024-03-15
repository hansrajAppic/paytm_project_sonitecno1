// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, file_names, prefer_interpolation_to_compose_strings


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';


class BillPAY_Screen extends StatefulWidget {
  final Map<String, dynamic> ResultBllFetch;

  BillPAY_Screen({super.key, required this.ResultBllFetch});

  @override
  State<BillPAY_Screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BillPAY_Screen> {
  bool Pays = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.LightnessSilverColor,
        appBar: AppBar(
          backgroundColor: AppColors.Redpurple,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Pay",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w900),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.darkwhiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: w * 0.03),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            dense: true,
                            leading: Image.network(
                              "https://sonitechno.info/images/icon/${widget.ResultBllFetch["OperatorLogo"].toString()}",
                              height: 28,
                              width: 30,
                            ),
                            title: Text(
                              widget.ResultBllFetch["OperatorName"].toString(),
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor),
                            ),
                            subtitle: Text(
                              widget.ResultBllFetch["billnumber"].toString(),
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blackColor),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 214, 207, 207),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Bill Details",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "HIDE",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.02,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height:
                                        10), // Add some space between the rows if needed
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Customer Name",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: h * 0.013,
                                        // ),
                                        Text(
                                          "Bill Date:",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        Text(
                                          "Due Date:",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ":  ${widget.ResultBllFetch["customername"].toString()}",
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          Text(
                                            ":  ${widget.ResultBllFetch["billdate"].toString()}",
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          Text(
                                            ":  ${widget.ResultBllFetch["duedate"].toString()}",
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          // Text(
                                          //   widget.ResultBllFetch["customername"]
                                          //       .toString(),
                                          //   style: TextStyle(
                                          //     fontSize: 11,
                                          //     fontWeight: FontWeight.w500,
                                          //     color: AppColors.blackColor,
                                          //   ),
                                          // ),
                                          // Text(
                                          //   widget.ResultBllFetch["billdate"]
                                          //       .toString(),
                                          //   style: TextStyle(
                                          //     fontSize: 11,
                                          //     fontWeight: FontWeight.w500,
                                          //     color: AppColors.blackColor,
                                          //   ),
                                          // ),
                                          // Text(
                                          //   widget.ResultBllFetch["duedate"]
                                          //       .toString(),
                                          //   style: TextStyle(
                                          //     fontSize: 11,
                                          //     fontWeight: FontWeight.w500,
                                          //     color: AppColors.blackColor,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color.fromARGB(
                                          255, 249, 239, 239),
                                      boxShadow: const [
                                        BoxShadow(
                                            // color:
                                            //     Color.fromARGB(69, 143, 145, 135),
                                            // blurRadius: 4,
                                            ),
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.04),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 10),
                                          child: Text(
                                            "₹ ${widget.ResultBllFetch["dueamount"]}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Text(
                                          "Due Date -" +
                                              widget.ResultBllFetch["duedate"]
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.redColor),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: h * 0.42,
                ),
                // SizedBox(
                //   height: h * 0.064,
                //   width: double.infinity,
                //   child: TextButton(
                //     style: TextButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(6)),
                //       backgroundColor: AppColors.Buttancolour,
                //     ),
                //     onPressed: () {
                //       // if (_formKey.currentState!.validate()) {}
                //       // // showProgressDialog(context);
                //       // if (_AmountController.text.characters.length > 12) {
                //       //   // showProgressDialog(context);
                //       // }
                //       //
                //     },
                //     child: const Text("PROCEED TO PAY",
                //         style: TextStyle(
                //             fontSize: 13,
                //             fontWeight: FontWeight.w500,
                //             color: AppColors.ButtonTextColor)),
                //   ),
                // ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
              // Text(
              //   'Text from TextInputClass:',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 10),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: h * 0.060,
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: AppColors.Buttancolour,
              ),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {}
                // // showProgressDialog(context);
                // if (_AmountController.text.characters.length > 12) {
                //   // showProgressDialog(context);
                // }
                //
              },
              child: const Text("PROCEED TO PAY",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.ButtonTextColor)),
            ),
          ),
        )
        );
  }
}
