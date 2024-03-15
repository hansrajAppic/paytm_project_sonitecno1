import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the function when the button is pressed
            navigateToDashboard();
          },
          child: Text('Go to Dashboard'),
        ),
      ),
    );
  }

  // Function to navigate to the DashboardScreen
  void navigateToDashboard() {
    // Here you can create a Profile_succfuly object with necessary data
    Profile_succfuly profile = Profile_succfuly(userid: '123', roleId: '456');

    // Navigate to the DashboardScreen and pass the Profile_succfuly object
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          userId: profile.userid,
          roleId: profile.roleId,
        ),
      ),
    );
  }
}

class Profile_succfuly {
  final String? userid;
  final String? roleId;

  Profile_succfuly({
    required this.userid,
    required this.roleId,
  });
}

class DashboardScreen extends StatelessWidget {
  final String? userId;
  final String? roleId;

  const DashboardScreen({Key? key, this.userId, this.roleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use userId and roleId as needed in your widget
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User ID: $userId'),
            Text('Role ID: $roleId'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Name(),
  ));
}
