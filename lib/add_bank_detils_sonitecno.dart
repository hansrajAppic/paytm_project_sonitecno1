// ignore_for_file: unused_local_variable, camel_case_types, prefer_const_constructors, sort_child_properties_last

// 
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/add_bank_screen.dart';

class Addbank_dettails_screen extends StatefulWidget {
  const Addbank_dettails_screen({super.key});

  @override
  State<Addbank_dettails_screen> createState() => _JioRechargeState();
}

class _JioRechargeState extends State<Addbank_dettails_screen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
          "Bank Details",
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
       ),

      // appBar: AppBar(
      //   backgroundColor: AppColors.redColor,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text(
      //     "Bank Details",
      //     style: const TextStyle(
      //         color: AppColors.whiteColor,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w500),
      //   ),
      // ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Add_BankScreen()));
                // Add your FAB onPressed logic here
              },
              child: Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
              backgroundColor: AppColors.Buttancolour,
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
