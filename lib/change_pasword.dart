// Import Flutter packages
// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, unnecessary_string_interpolations, avoid_print, no_leading_underscores_for_local_identifiers, unused_element

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globale_class.dart';

// Define the ChangePasswordChangeScreen widget
class ChangePasswordChangeScreen extends StatefulWidget {
  @override
  _ChangePasswordChangeScreenState createState() =>
      _ChangePasswordChangeScreenState();
}

// Define the state for the ChangePasswordChangeScreen widget
class _ChangePasswordChangeScreenState
    extends State<ChangePasswordChangeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isVisible = false;
  bool _isVisible1 = false;
  bool _isVisibl2 = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Scaffold widget defines the basic structure of the visual interface
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: const Text(
      //     'Change Password',
      //     style: TextStyle(
      //         fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
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
          'Change Password',
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Old Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: oldPasswordController,
                  obscureText: !_isVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter old password.';
                    }
                    // Add custom validation logic for old password
                    // Example: Check if the old password matches a stored value
                    // if (value != 'storedOldPassword') {
                    //   return 'Incorrect old password.';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    hintText: 'Enter old password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'New Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: newPasswordController,
                  obscureText: !_isVisible1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password.';
                    }
                    // Add custom validation logic for new password
                    // Example: Check if the new password meets certain criteria
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible1 = !_isVisible1;
                        });
                      },
                      icon: _isVisible1
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    hintText: 'Enter new password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !_isVisibl2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm new password.';
                    }
                    // Add custom validation logic for confirming new password
                    if (value != newPasswordController.text) {
                      return 'Passwords do not match.';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisibl2 = !_isVisibl2;
                        });
                      },
                      icon: _isVisibl2
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    hintText: 'Confirm new password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: !_isLoading
                      ? const Text("")
                      : const CircularProgressIndicator(),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: w * 0.4,
                      height: h * 0.050,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            backgroundColor: Colors.red),
                        onPressed: () {},
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: w * 0.4,
                      height: h * 0.050,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            backgroundColor: Colors.red),
                        onPressed: () {
                          // ignore: unused_local_variable
                          String oldPassword = oldPasswordController.text;
                          String newPassword = newPasswordController.text;
                          String confirmPassword =
                              confirmPasswordController.text;
                          if (newPassword == confirmPassword) {
                            passwordApi();
                            if (_formKey.currentState!.validate()) {
                              // Perform the password change operation

                              // Handle password change logic here
                              // You may want to validate the passwords and handle the change logic
                            }

                            // You may want to validate the passwords and handle the change logic
                          } else {
                            // Display an error message that passwords do not match
                            // You may want to show a snackbar or alert dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'New password and confirm password do not match.'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> passwordApi() async {
    setState(() {
      // Set the flag to true when starting the password change
      _isLoading = true;
    });

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
    String? userDatapassword = sp.getString(SpleshScrrenState.Password);

    if (userDataPref != null && userDatapassword != null) {
      try {
        String? deviceID = await MyGlobalFunctions.getId();
        String requestBody = '''
        {
          "MethodName": "changedpin",
          "UserID": "$userDataPref",
          "Password": "$userDatapassword",
          "NewPassword": "${newPasswordController.text}",
          "OldPassword": "${oldPasswordController.text}",
          "Confirm": "${confirmPasswordController.text}",
          "AppType": "Apps"
        }
      ''';

        String? changedpin =
            await MyGlobalFunctions.PostCall(requestBody, deviceID);

        final data = json.decode(changedpin!);
        if (data["statuscode"] == "TXN") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${data["status"].toString()}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          );
        } else if (data["status"] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              data["status"].toString(),
              style: const TextStyle(fontSize: 10),
            )),
          );
        }
      } catch (error) {
        // Handle errors appropriately
        print("Error in passwordApi: $error");
      } finally {
        setState(() {
          // Set the flag to false when password change is complete
          _isLoading = false;
        });
      }
    }
    _submitPasswordForm() async {
      if (_formKey.currentState!.validate()) {
        // You can show the CircularProgressIndicator here if needed
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: CircularProgressIndicator(),
        //   ),
        // );
        await passwordApi();
      }
    }
  }
}
