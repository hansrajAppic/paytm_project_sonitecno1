// import 'package:bype_techno_projects1/Globale_class/colors.dart';
// import 'package:bype_techno_projects1/dashboard_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(Support_Screen());
// }

// final List<MapEntry<IconData, String>> icons = [
//   MapEntry(Icons.account_balance, 'Account Balance'),
//   MapEntry(Icons.attach_money, 'Attach Money'),
//   MapEntry(Icons.credit_card, 'Credit Card'),
//   MapEntry(Icons.account_balance_wallet, 'Account Balance '),
//   MapEntry(Icons.monetization_on, 'Monetization On'),
//   MapEntry(Icons.payment, 'Payment'),
//   MapEntry(Icons.monetization_on, 'Monetization On'),
//   MapEntry(Icons.payment, 'Payment'),
// ];
// final List<MapEntry<IconData, String>> Listicons = [
//   MapEntry(Icons.phone_android, 'Mobaile Recharg'),
//   MapEntry(Icons.motion_photos_pause, 'Mobaile Postped'),
//   MapEntry(Icons.wifi_tethering_error_rounded, ' Electricity bill '),
//   MapEntry(Icons.account_balance_wallet, 'Credit Card Bill '),
//   MapEntry(Icons.arrow_forward, 'viw More'),
// ];


// class Support_Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Icon(
//             Icons.help_outline_outlined,
//             color: Colors.white,
//             size: 22,
//           ),
//           SizedBox(
//             width: w * 0.02,
//           )
//         ],
//         backgroundColor: AppColors.PinkColors,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
//             onPressed: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => DashBord_Screen()))),
//         title: Text(
//           '',
//           style: const TextStyle(
//               color: AppColors.whiteColor,
//               fontSize: 16,
//               fontWeight: FontWeight.w800),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: w * 0.025),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'WeLcome to Help & Support',
//                 style: TextStyle(
//                   fontSize: 23.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Hi ,What can we help you with?',
//                 style: TextStyle(
//                   fontSize: 13.0,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.013,
//               ),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border(
//                     left: BorderSide(color: Colors.blue, width: 4.0),
//                     right: BorderSide(color: Colors.red, width: 4.0),
//                     top: BorderSide(color: Colors.green, width: 4.0),
//                     bottom:
//                         BorderSide(color: AppColors.Buttancolour, width: 4.0),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: w * 0.02, vertical: h * 0.002),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Your Sonitechno',
//                         style: TextStyle(
//                           fontSize: 17.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Will Work Like alwayes!',
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'We re committed & doing our best to \nminimize any inconvenience.',
//                                 style: TextStyle(
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: h * 0.045,
//                             child: TextButton(
//                                 onPressed: () {},
//                                 style: TextButton.styleFrom(
//                                     backgroundColor: Colors.blue),
//                                 child: Text(
//                                   "Know more",
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       color: AppColors.whiteColor),
//                                 )),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: h * 0.02,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.006,
//               ),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         const Color.fromARGB(255, 241, 236, 236),
//                         Color.fromARGB(255, 190, 222, 245),
//                         Color(0xffd4e1e7),
//                         Color.fromARGB(255, 203, 230, 252),
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'BANKING SERVICES & PAYMENTS\n Powered by PaytmXents',
//                         style: TextStyle(
//                             fontSize: 12.0,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.Buttancolour),
//                       ),
//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 4,
//                           mainAxisSpacing: 4.0,
//                           crossAxisSpacing: 4.0,
//                         ),
//                         itemCount: icons.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(horizontal: w * 0.02),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment
//                                   .center, // Align items at the center vertically
//                               children: [
//                                 Icon(icons[index].key, size: 25),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   icons[index].value,
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign
//                                       .center, // Align text at the center horizontally
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.008,
//               ),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.black54)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'RECHARGE & BILL PAYMENTS',
//                         style: TextStyle(
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.blackColor),
//                       ),
//                       Text(
//                         'Powered by BBPS',
//                         style: TextStyle(
//                             fontSize: 10.0,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.blackColor),
//                       ),
//                       SingleChildScrollView(
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 5,
//                                   mainAxisSpacing: 2.0,
//                                   crossAxisSpacing: 2.0,
//                                   childAspectRatio: 4 / 5),
//                           itemCount: Listicons.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding:
//                                   EdgeInsets.symmetric(horizontal: w * 0.02),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Listicons[index].key, size: 20),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     Listicons[index].value,
//                                     style: TextStyle(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.008,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Enter Amount',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('Proceed to Pay'),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Recent Transactions',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: 5, // Assuming 5 recent transactions
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     leading: Icon(Icons.monetization_on),
//                     title: Text('Transaction #$index'),
//                     subtitle: Text('Amount: \$100'),
//                     trailing: Icon(Icons.arrow_forward_ios),
//                     onTap: () {
//                       // Action to view transaction details
//                     },
//                   );
//                 },
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/Global.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/company_logain_details_model.dart';
import 'package:paytm_project_sonitecno2/homnave_scree.dart';

void main() {
  runApp(Support_Screen());
}

class Support_Screen extends StatefulWidget {
  @override
  _Support_ScreenState createState() => _Support_ScreenState();
}

class _Support_ScreenState extends State<Support_Screen> {
  final List<MapEntry<IconData, String>> icons = [
    MapEntry(Icons.account_balance, 'Account Balance'),
    MapEntry(Icons.attach_money, 'Attach Money'),
    MapEntry(Icons.credit_card, 'Credit Card'),
    MapEntry(Icons.account_balance_wallet, 'Account Balance '),
    MapEntry(Icons.monetization_on, 'Monetization On'),
    MapEntry(Icons.payment, 'Payment'),
    MapEntry(Icons.monetization_on, 'Monetization On'),
    MapEntry(Icons.payment, 'Payment'),
  ];

  final List<MapEntry<IconData, String>> listIcons = [
    MapEntry(Icons.phone_android, 'Mobile Recharge'),
    MapEntry(Icons.motion_photos_pause, 'Mobile Postpaid'),
    MapEntry(Icons.wifi_tethering_error_rounded, 'Electricity Bill'),
    MapEntry(Icons.account_balance_wallet, 'Credit Card Bill'),
    MapEntry(Icons.arrow_forward, 'View More'),
  ];
  Global globalInstance = Global();
  CompanyData? companyData;

  @override
  void initState() {
    _assignCustomerData();
    super.initState();
  }

  void _assignCustomerData() async {
    companyData = await globalInstance.getCompanyData();
    setState(() {
      companyData = companyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
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
          // onPressed: () => Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => DashBord_Screen())),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreens(
                          index: 0,
                        )));
          },
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Image.network(
            "https://sonitechno.info/images/Company/${(companyData != null ? companyData!.data![0].logo : "")}",
            height: 200,
            width: 170,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'WeLcome to Help & Support',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Hi, What can we help you with?',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: h * 0.013,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4.0),
                    right: BorderSide(color: Colors.red, width: 4.0),
                    top: BorderSide(color: Colors.green, width: 4.0),
                    bottom:
                        BorderSide(color: AppColors.Buttancolour, width: 4.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.02, vertical: h * 0.002),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your Sonitechno',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Will Work Like always!',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'We’re committed & doing our best to\n minimize any inconvenience.',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.045,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: Text(
                                "Know more",
                                style: TextStyle(
                                    fontSize: 13, color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.006,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 210, 217, 245),
                      Color.fromARGB(255, 190, 222, 245).withOpacity(0.1),
                      Color(0xffd4e1e7),
                      Color.fromARGB(255, 203, 230, 252),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BANKING SERVICES & PAYMENTS\n Powered by PaytmXents',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.Buttancolour,
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                        itemCount: icons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(icons[index].key, size: 25),
                                SizedBox(height: 4),
                                Text(
                                  icons[index].value,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.008,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black54),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RECHARGE & BILL PAYMENTS',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Text(
                        'Powered by BBPS',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SingleChildScrollView(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0,
                            childAspectRatio: 4 / 5,
                          ),
                          itemCount: listIcons.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(listIcons[index].key, size: 20),
                                  SizedBox(height: 4),
                                  Text(
                                    listIcons[index].value,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.008,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Proceed to Pay'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                itemCount: 5, // Assuming 5 recent transactions
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text('Transaction #$index'),
                    subtitle: Text('Amount: \$100'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Action to view transaction details
                    },
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
