import 'package:flutter/material.dart';

void main() {
  runApp(ssss());
}

class ssss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Number Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MobileNumberTable(),
    );
  }
}

class MobileNumberTable extends StatefulWidget {
  @override
  _MobileNumberTableState createState() => _MobileNumberTableState();
}

class _MobileNumberTableState extends State<MobileNumberTable> {
  TextEditingController _mobileController = TextEditingController();
  String mobileNumber = '';
  bool showTable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Number Table Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Enter 10-digit Mobile Number',
                hintText: '1234567890',
              ),
              onChanged: (value) {
                setState(() {
                  mobileNumber = value;
                  if (value.length == 10) {
                    showTable = true;
                  } else {
                    showTable = false;
                  }
                });
              },
            ),
            SizedBox(height: 20),
            Visibility(
              visible: showTable,
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Name'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mobile Number'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Rating'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Javatpoint'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mobileNumber),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('5*'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
