
import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/Globale_class/Global.dart';
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/Json_model/company_logain_details_model.dart';
import 'package:paytm_project_sonitecno2/homnave_scree.dart';

void main() {
  runApp(MaterialApp(
    home: ReportScreen(),
  ));
}

class ReportScreen extends StatefulWidget {
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<Map<String, dynamic>> containerData = [
    {'icon': Icons.download, 'color': Colors.white, 'text': 'DownLine'},
    {
      'icon': Icons.favorite,
      'color': Colors.white,
      'text': 'Main Wallet History'
    },
    {
      'icon': Icons.account_balance,
      'color': Colors.white,
      'text': 'Settlement History'
    },
    {
      'icon': Icons.camera,
      'color': Colors.white,
      'text': 'AEPS Wallet History'
    },
    {'icon': Icons.email, 'color': Colors.white, 'text': 'MATM History'},
    {
      'icon': Icons.access_alarm,
      'color': Colors.white,
      'text': 'e-Ticket History'
    },
    {'icon': Icons.emoji_events, 'color': Colors.white, 'text': 'NSDL History'},
    {'icon': Icons.add_alarm, 'color': Colors.white, 'text': 'UTI History'},
    {
      'icon': Icons.directions_bike,
      'color': Colors.white,
      'text': 'Recharge History'
    },
    {
      'icon': Icons.brightness_5,
      'color': Colors.white,
      'text': 'Money Transfer History'
    },
    {'icon': Icons.phone, 'color': Colors.white, 'text': 'AEPS Txn History'},
    {'icon': Icons.star, 'color': Colors.white, 'text': 'Main Wallet History'},
    {
      'icon': Icons.favorite,
      'color': Colors.white,
      'text': 'Settlement History'
    },
    {
      'icon': Icons.attach_money,
      'color': Colors.white,
      'text': 'Upi Send History'
    },
    {
      'icon': Icons.camera,
      'color': Colors.white,
      'text': 'AEPS Wallet History'
    },
    {'icon': Icons.email, 'color': Colors.white, 'text': 'MATM History'},
    {
      'icon': Icons.access_alarm,
      'color': Colors.white,
      'text': 'e-Ticket History'
    },
    {'icon': Icons.emoji_events, 'color': Colors.white, 'text': 'NSDL History'},
    {'icon': Icons.add_alarm, 'color': Colors.white, 'text': 'UTI History'},
    {
      'icon': Icons.directions_bike,
      'color': Colors.white,
      'text': 'Recharge History'
    },
    {
      'icon': Icons.brightness_5,
      'color': Colors.white,
      'text': 'Money Transfer History'
    },
    {'icon': Icons.phone, 'color': Colors.white, 'text': 'AEPS Txn History'},
    // Add more entries as needed
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
          // onPressed: () => Navigator.of(context).pop(),o
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
      body: ListView.builder(
        itemCount: containerData.length,
        itemBuilder: (context, index) {
          final item = containerData[index];
          return buildContainer(item);
        },
      ),
    );
  }

  Widget buildContainer(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: item['color'], // Use the color from the data
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(69, 143, 145, 135),
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(item['icon'], color: Colors.black),
            SizedBox(width: 16.0),
            Text(
              item['text'],
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
