// Import necessary Flutter and project-specific packages
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/circularProgressIndicator_class.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/globale_class.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the UpiTransferScreen widget
class UpiTransferScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final result = "";
  const UpiTransferScreen({Key? key}) : super(key: key);

  @override
  State<UpiTransferScreen> createState() => _UpiTransferScreenState();
}

class _UpiTransferScreenState extends State<UpiTransferScreen> {
  // TextEditingControllers to control the inputs
  final TextEditingController upiController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonDisabled = false;

  bool isLoading = false;
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  // Validator for UPI ID
  String? _validateUpiId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a UPI ID';
    }
    return null;
  }

  String? _validateNameId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a Name';
    }
    return null;
  }

  Barcode? result;

  @override
  Widget build(BuildContext context) {
    // Shortcuts for media query dimensions
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColors.Buttancolour, // Check for correct variable name
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Send Money',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
        ),
        actions: [
          Icon(Icons.help_outline_outlined, color: Colors.white, size: 22),
          SizedBox(width: width * 0.02),
        ],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.02),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalCircularProgressIndicator(isLoading: isLoading),
                    Center(
                      child:
                          Image.asset("assets/images/BhimUpi.png", height: 70),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: upiController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 15, 0, 15),
                              labelText: 'UPI ID',
                              hintText: 'Enter UPI ID',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              // prefix: Text(
                              //   widget.result,
                              //   style: TextStyle(fontSize: 16),
                              // ),
                            ),
                            validator: _validateUpiId,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              color: AppColors.Buttancolour,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                // Navigate to QR code scanner screen
                                final result = await Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => QRViewExample(),
                                ));

                                // Handle the result returned from QR code scanner screen
                                if (result != null) {
                                  setState(() {
                                    upiController.text = result.code
                                        .toString()
                                        .replaceAll("upi://pay?pa=", "")
                                        .split("&")[0]
                                        .toString();
                                    ''; // Update UPI ID field with scanned result

                                    nameController.text = result.code
                                        .toString()
                                        .replaceAll("upi://pay?pa=", "")
                                        .split("&")[1]
                                        .toString()
                                        .replaceAll("pn=", "");
                                    '';
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.qr_code_scanner,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Name',
                        hintText: 'Enter Name',
                      ),
                      validator: _validateNameId,
                      // Set the default value using initialValue

                      onChanged: (value) {
                        // Do something when the value changes
                        print("New value: $value");
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          isLoading == true
                              ? AppColors.BUttonDisable
                              : AppColors.Buttancolour,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size(0, 30), // Minimum size of the button
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            VerifayApi();
                          }
                          isButtonDisabled = !isButtonDisabled;
                        });
                        // GetBillFetchData();
                      },
                      child: Text(
                        'Verify UPI',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
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
                    // ElevatedButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       if (_formKey.currentState!.validate()) {
                    //         VerifayApi();
                    //       }

                    //       isButtonDisabled = !isButtonDisabled;
                    //     });
                    //   },
                    //   child: Text(isButtonDisabled
                    //       ? 'Enable Button'
                    //       : 'Disable Button'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isButtonDisabled = !isButtonDisabled;
                        });
                        //
                        if (_formKey.currentState!.validate()) {
                          isButtonDisableds();
                        }
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
                            : AppColors
                                .Buttancolour), // Check for correct variable name
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        minimumSize:
                            Size(double.infinity, 40), // Set the button size
                      ),
                    ),
                    SizedBox(
                      height: height * 0.018,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpiTransferApi() async {
    setState(() {
      isLoading = true;
    });
    try {
      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final sendamtupi = await MyGlobalFunctions.PostCall(
          '{"MethodName":"sendamtupi","UserID":"${userDataPref}","Password":"${userDatapassword}", "upiid": "${upiController.text}" ,"Amount": "${amountController.text}","TPIN": "12345",}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(sendamtupi!);

        if (data["statuscode"] == "TXN") {}
        MyGlobalFunctions.errorMessage(context, data["status"].toString());
      }
    } catch (error) {
      // Handle error gracefully
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> VerifayApi() async {
    setState(() {
      isLoading = true;
    });
    try {
      final sp = await SharedPreferences.getInstance();
      final userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      final userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final upiverification = await MyGlobalFunctions.PostCall(
          '{"MethodName":"upiverification","UserID":"${userDataPref}","Password":"${userDatapassword}", "upiid": "${upiController.text}" ,}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(upiverification!);

        if (data["statuscode"] == "TXN") {
          setState(() {
            nameController.text = data["status"].toString();
            isLoading = false;
          });
        } else {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
          setState(() {
            nameController.text = "";
          });
        }
      }
    } catch (error) {
      // Handle error gracefully
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  isButtonDisableds() {
    if (isLoading == false) {
      setState(() {
        VerifayApi();
      });
    }
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
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
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
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
      ),
    );
  }

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
      onQRViewCreated: (controller) => _onQRViewCreated(context, controller),
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(BuildContext context, QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

        ///MyGlobalFunctions.showAlertDialog(context, result as String);
        // Navigator.of(context)
        //     .pop(result);
        Navigator.of(context)
            .maybePop(result); // Pass scanned data back to previous screen
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
