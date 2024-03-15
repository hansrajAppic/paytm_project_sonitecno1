// // import 'dart:developer';
// // import 'dart:io';

// // import 'package:bype_techno_projects1/Globale_class/colors.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';

// // void main() {
// //   runApp(QrScannerOverlayShape());
// // }

// // class QrScannerOverlayShape extends StatefulWidget {
// //   @override
// //   State<QrScannerOverlayShape> createState() => _QrScannerOverlayShapeState();
// // }

// // class _QrScannerOverlayShapeState extends State<QrScannerOverlayShape> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'QR Code Scanner',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: QRViewExample(),
// //     );
// //   }
// // }

// // class QRViewExample extends StatefulWidget {
// //   @override
// //   _QRViewExampleState createState() => _QRViewExampleState();
// // }

// // class _QRViewExampleState extends State<QRViewExample> {
// //   Barcode? result;
// //   bool islodaing = false;
// //   QRViewController? controller;
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   final TextEditingController upiController = TextEditingController();
// //   final TextEditingController amountController = TextEditingController();

// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //   bool isScanning = false;

// //   // Validator for UPI ID
// //   String? _validateUpiId(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Please enter a UPI ID';
// //     } else if (!value.contains('@')) {
// //       return 'Please enter a valid UPI ID';
// //     }
// //     return null;
// //   }

// //   // In order to get hot reload to work we need to pause the camera if the platform
// //   // is android, or resume the camera if the platform is iOS.
// //   @override
// //   void reassemble() {
// //     super.reassemble();
// //     if (Platform.isAndroid) {
// //       controller!.pauseCamera();
// //     }
// //     controller!.resumeCamera();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('QR Code Scanner'),
// //       ),
// //       body: isScanning ? buildScanner() : buildResult(),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           setState(() {
// //             isScanning = !isScanning; // Toggle scanning state
// //             if (!isScanning) {
// //               result = null; // Reset result when starting scanning again
// //             }
// //           });
// //         },
// //         child: Icon(isScanning ? Icons.qr_code : Icons.close),
// //       ),
// //     );
// //   }

// //   Widget buildScanner() {
// //     double height = MediaQuery.of(context).size.height;
// //     double width = MediaQuery.of(context).size.width;
// //     return Form(
// //       autovalidateMode: AutovalidateMode.always,
// //       key: _formKey,
// //       child: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(
// //             horizontal: width * 0.02,
// //             vertical: height * 0.02,
// //           ),
// //           child: Container(
// //             decoration: BoxDecoration(border: Border.all()),
// //             child: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Center(
// //                     child: Image.asset(
// //                       "assets/images/BhimUpi.png",
// //                       height: 70,
// //                     ),
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Expanded(
// //                         child: TextFormField(
// //                           controller: upiController,
// //                           keyboardType: TextInputType.text,
// //                           decoration: InputDecoration(
// //                             contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
// //                             labelText: 'UPI ID',
// //                             hintText: 'Enter UPI ID',
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(8.0),
// //                             ),
// //                             prefix: Text(
// //                               result != null
// //                                   ? 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'
// //                                   : "",
// //                               style: TextStyle(fontSize: 16),
// //                             ),
// //                           ),
// //                           validator: _validateUpiId,
// //                         ),
// //                       ),
// //                       SizedBox(width: width * 0.02),
// //                       Container(
// //                         height: height * 0.06,
// //                         width: width * 0.1,
// //                         decoration: BoxDecoration(
// //                           color: AppColors.Buttancolour, // Adjust as needed
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                         child: IconButton(
// //                           onPressed: () {
// //                             // Implement navigation or other functionality
// //                           },
// //                           icon: Icon(isScanning ? Icons.qr_code : Icons.close),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   ElevatedButton(
// //                     style: ButtonStyle(
// //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                         RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(18.0),
// //                           side: BorderSide(color: Colors.red),
// //                         ),
// //                       ),
// //                       minimumSize: MaterialStateProperty.all(
// //                           Size(0, 30)), // Minimum size of the button
// //                     ),
// //                     onPressed: () {},
// //                     child: Text('Verify UPI'),
// //                   ),
// //                   SizedBox(height: height * 0.02),
// //                   TextFormField(
// //                     controller: amountController,
// //                     keyboardType: TextInputType.number,
// //                     decoration: InputDecoration(
// //                       contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
// //                       labelText: 'Amount',
// //                       hintText: 'Enter amount',
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(8.0),
// //                       ),
// //                     ),
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter the amount';
// //                       }
// //                       return null;
// //                     },
// //                   ),
// //                   SizedBox(height: height * 0.03),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       // Add your onPressed logic here
// //                     },
// //                     child: const Text(
// //                       'Send Money',
// //                       style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.bold,
// //                           color: AppColors.whiteColor),
// //                     ),
// //                     style: ElevatedButton.styleFrom(
// //                       primary: (islodaing == true
// //                           ? AppColors.BUttonDisable // Correct the variable name
// //                           : AppColors.Buttancolour), // Adjust as needed
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(18.0),
// //                       ),
// //                       minimumSize:
// //                           Size(double.infinity, 40), // Set the button size
// //                     ),
// //                   ),
// //                   SizedBox(height: height * 0.018),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildResult() {
// //     return Column(
// //       children: <Widget>[
// //         Expanded(
// //           flex: 4,
// //           child: _buildQrView(context),
// //         ),
// //         Expanded(
// //           flex: 1,
// //           child: FittedBox(
// //             fit: BoxFit.contain,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: <Widget>[
// //                 if (result != null)
// //                   Text(
// //                     'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
// //                   )
// //                 else
// //                   const Text('Scan a code'),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: <Widget>[
// //                     Container(
// //                       margin: const EdgeInsets.all(8),
// //                       child: ElevatedButton(
// //                         onPressed: () async {
// //                           await controller?.toggleFlash();
// //                           setState(() {});
// //                         },
// //                         child: FutureBuilder(
// //                           future: controller?.getFlashStatus(),
// //                           builder: (context, snapshot) {
// //                             return Text('Flash: ${snapshot.data}');
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                     Container(
// //                       margin: const EdgeInsets.all(8),
// //                       child: ElevatedButton(
// //                         onPressed: () async {
// //                           await controller?.flipCamera();
// //                           setState(() {});
// //                         },
// //                         child: FutureBuilder(
// //                           future: controller?.getCameraInfo(),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.data != null) {
// //                               return Text(
// //                                   'Camera facing ${describeEnum(snapshot.data!)}');
// //                             } else {
// //                               return const Text('loading');
// //                             }
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: <Widget>[
// //                     Container(
// //                       margin: const EdgeInsets.all(8),
// //                       child: ElevatedButton(
// //                         onPressed: () async {
// //                           if (!isScanning) {
// //                             await controller?.resumeCamera();
// //                             setState(() {
// //                               isScanning = true;
// //                             });
// //                           } else {
// //                             await controller?.pauseCamera();
// //                             setState(() {
// //                               isScanning = false;
// //                             });
// //                           }
// //                         },
// //                         child: Text(
// //                           isScanning ? 'Stop' : 'Scan',
// //                           style: TextStyle(fontSize: 20),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildQrView(BuildContext context) {
// //     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
// //     var scanArea = (MediaQuery.of(context).size.width < 400 ||
// //             MediaQuery.of(context).size.height < 400)
// //         ? 150.0
// //         : 300.0;
// //     // To ensure the Scanner view is properly sizes after rotation
// //     // we need to listen for Flutter SizeChanged notification and update controller
// //     return QRView(
// //       key: qrKey,
// //       onQRViewCreated: _onQRViewCreated,
// //       // overlay: QrScannerOverlayShape(
// //       //   borderColor: Colors.red,
// //       //   borderRadius: 10,
// //       //   borderLength: 30,
// //       //   borderWidth: 10,
// //       //   cutOutSize: scanArea,
// //       // ),
// //       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
// //     );
// //   }

// //    void _onQRViewCreated(QRViewController controller) {
// //     controller.scannedDataStream.listen((scanData) {
// //       setState(() {
// //         result = scanData;
// //         isScanning = false; // Switch to showing the result
// //       });
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }
// // }


// import 'package:bype_techno_projects1/Globale_class/colors.dart';
// import 'package:flutter/foundation.dart';
// //   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
// //     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
// //     if (!p) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('no Permission')),
// //       );
// //     }
// //   }
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// void main() {
//   runApp(SSS());
// }

// class SSS extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Code Scanner',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QRViewExample(),
//     );
//   }
// }

// class QRViewExample extends StatefulWidget {
//   @override
//   _QRViewExampleState createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   bool isLoading = false;
//   bool isScanning = true;
//   final TextEditingController upiController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String? _validateUpiId(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a UPI ID';
//     } else if (!value.contains('@')) {
//       return 'Please enter a valid UPI ID';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Scanner'),
//       ),
//       body: isScanning ? buildScanner() : buildResult(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             isScanning = !isScanning;
//             if (!isScanning) {
//               result = null;
//             }
//           });
//         },
//         child: Icon(isScanning ? Icons.qr_code : Icons.close),
//       ),
//     );
//   }

//   Widget buildScanner() {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Form(
//       autovalidateMode: AutovalidateMode.always,
//       key: _formKey,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: width * 0.02,
//             vertical: height * 0.02,
//           ),
//           child: Container(
//             decoration: BoxDecoration(border: Border.all()),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Image.asset(
//                       "assets/images/BhimUpi.png",
//                       height: 70,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           controller: upiController,
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
//                             labelText: 'UPI ID',
//                             hintText: 'Enter UPI ID',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             prefix: Text(
//                               result != null
//                                   ? 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'
//                                   : "",
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                           validator: _validateUpiId,
//                         ),
//                       ),
//                       SizedBox(width: width * 0.02),
//                       Container(
//                         height: height * 0.06,
//                         width: width * 0.1,
//                         decoration: BoxDecoration(
//                           color: AppColors.Buttancolour,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: IconButton(
//                           onPressed: () {
//                             // Implement navigation or other functionality
//                           },
//                           icon: Icon(isScanning ? Icons.qr_code : Icons.close),
//                         ),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                           side: BorderSide(color: Colors.red),
//                         ),
//                       ),
//                       minimumSize: MaterialStateProperty.all(Size(0, 30)),
//                     ),
//                     onPressed: () {},
//                     child: Text('Verify UPI'),
//                   ),
//                   SizedBox(height: height * 0.02),
//                   TextFormField(
//                     controller: amountController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
//                       labelText: 'Amount',
//                       hintText: 'Enter amount',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the amount';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: height * 0.03),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your onPressed logic here
//                     },
//                     child: const Text(
//                       'Send Money',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.whiteColor),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: (isLoading == true
//                           ? AppColors.BUttonDisable
//                           : AppColors.Buttancolour),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       minimumSize: Size(double.infinity, 40),
//                     ),
//                   ),
//                   SizedBox(height: height * 0.018),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildResult() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (result != null)
//             Text(
//               'Result: ${result!.code}',
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 isScanning = true;
//                 result = null;
//               });
//             },
//             child: Text('Scan Again'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//         isScanning = false;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

import 'dart:developer';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(sss());
}

class sss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRViewExample(),
    );
  }
}

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // bool isScanning =
  //     true; /
  //
  //final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  bool isLoading = false;
  bool isScanning = true;
  final TextEditingController upiController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateUpiId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a UPI ID';
    } else if (!value.contains('@')) {
      return 'Please enter a valid UPI ID';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: isScanning ? buildScanner() : buildResult(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isScanning = !isScanning; // Toggle scanning state
            if (!isScanning) {
              result = null; // Reset result when starting scanning again
            }
          });
        },
        child: Icon(isScanning ? Icons.qr_code : Icons.close),
      ),
    );
  }

  Widget buildScanner() {
    return Column(
      children: <Widget>[
        Expanded(flex: 4, child: _buildQrView(context)),
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // if (result != null)
                //   Text(
                //       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                // else
                //   const Text('Scan a code'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              return Text('Flash: ${snapshot.data}');
                            },
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                          onPressed: () async {
                            await controller?.flipCamera();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Text(
                                    'Camera facing ${describeEnum(snapshot.data!)}');
                              } else {
                                return const Text('loading');
                              }
                            },
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller?.pauseCamera();
                        },
                        child:
                            const Text('pause', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller?.resumeCamera();
                        },
                        child: const Text('resume',
                            style: TextStyle(fontSize: 20)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildResult() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.02,
          ),
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/BhimUpi.png",
                      height: 70,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: upiController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                            labelText: 'UPI ID',
                            hintText: 'Enter UPI ID',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            // prefix: Text(
                            //   result != null
                            //       ? 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'
                            //       : "",
                            //   style: TextStyle(fontSize: 16),
                            // ),
                          ),
                          validator: _validateUpiId,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Container(
                        height: height * 0.06,
                        width: width * 0.1,
                        decoration: BoxDecoration(
                          color: AppColors.Buttancolour,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // child: IconButton(
                        //   onPressed: () {
                        //     // Implement navigation or other functionality
                        //   },
                        //   icon: Icon(isScanning ? Icons.qr_code : Icons.close),
                        // ),
                        child: IconButton(
                          onPressed: () async {
                            // Navigate to QR scanner screen
                            var scannedResult =
                                await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QRViewExample(),
                              ),
                            );

                            // Handle scanned result
                            if (scannedResult != null &&
                                scannedResult is Barcode) {
                              setState(() {
                                result = scannedResult;
                                upiController.text = result!
                                    .code!; // Set scanned UPI ID to the text field
                              });
                            }
                          },
                          icon: Icon(
                            Icons.qr_code_scanner,
                            color: AppColors.whiteColor,
                          ),
                        ),

                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(0, 30)),
                    ),
                    onPressed: () {},
                    child: Text('Verify UPI'),
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                      labelText: 'Amount',
                      hintText: 'Enter amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the amount';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    child: const Text(
                      'Send Money',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: (isLoading == true
                          ? AppColors.BUttonDisable
                          : AppColors.Buttancolour),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      minimumSize: Size(double.infinity, 40),
                    ),
                  ),
                  SizedBox(height: height * 0.018),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildResult() {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [

  //         // Text(
  //         //   'Result: ${result!.code}',
  //         //   style: TextStyle(fontSize: 20.0),
  //         // ),
  //         // ElevatedButton(
  //         //   onPressed: () {
  //         //     setState(() {
  //         //       isScanning = true; // Switch back to scanning mode
  //         //       result = null; // Reset result when starting scanning again
  //         //     });
  //         //   },
  //         //   child: Text('Scan Again'),
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
