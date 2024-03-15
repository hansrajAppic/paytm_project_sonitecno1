// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, duplicate_ignore, avoid_print, camel_case_types

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_project_sonitecno2/Globale_class/colors.dart';
import 'package:paytm_project_sonitecno2/dashboard_screen.dart';
import 'package:paytm_project_sonitecno2/plan_recharge_screen.dart';

void main() async {
  runApp(Serch_contacts_Screen());
}

class Serch_contacts_Screen extends StatelessWidget {
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  List<Contact>? _contacts;
  List<Contact>? _filteredContacts;
  List<String>? getcircles;
  bool showhidelist = false;
  // To manage API loading state
  // ignore: non_constant_identifier_names
  String SearchNumber = "";

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    // Request permission to access contacts
    if (await FlutterContacts.requestPermission()) {
      final contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      setState(() {
        _contacts = contacts;
        _filteredContacts = contacts;
      });
    } else {}
  }

  void _filterContacts(String query) {
    // Filter contacts based on search query
    if (query.isNotEmpty) {
      setState(() {
        _filteredContacts = _contacts
            ?.where((contact) =>
                contact.name.first
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                contact.name.last.toLowerCase().contains(query.toLowerCase()) ||
                contact.phones
                    .any((phone) => phone.number.contains(query.toLowerCase())))
            .toList();

        // ignore: prefer_is_empty
        if (_filteredContacts?.length == 0) {
          setState(() {
            showhidelist = true;
            SearchNumber = query;
          });
        } else {
          showhidelist = false;
          SearchNumber = query;
        }
      });
    } else {
      setState(() {
        _filteredContacts = _contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
          // onPressed: () => Navigator.of(context).pop(),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBord_Screen(
                   )),
          ),
        ),
        title: Text(
          "Mobile Recharge",
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _isLoading ? CircularProgressIndicator() : SizedBox(),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                "assets/images/rsz_paytms.png",
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            TextFormField(
              onChanged: _filterContacts,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  labelText: 'Search by Number or Name',
                  hintText: 'Search by Number or Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22))),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox(),
            Expanded(
              child: _filteredContacts == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22)),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: h * 0.03, left: w * 0.043),
                            child: Text(
                              "Recents",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor),
                            ),
                          ),
                          Visibility(
                            visible: showhidelist,
                            child: InkWell(
                              onTap: () {
                                _getcirclesApi(SearchNumber);
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.brown,
                                    child: Icon(Icons.person)),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(SearchNumber,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    Text(SearchNumber,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      "Tap To Recharge this number",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Buttancolour),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _filteredContacts!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final contact = _filteredContacts![index];
                                Uint8List? image = contact.photo;
                                String num = (contact.phones.isNotEmpty)
                                    ? contact.phones.first.number
                                    : "--";
                                return ListTile(
                                  leading: (contact.photo == null)
                                      ? CircleAvatar(child: Icon(Icons.person))
                                      : CircleAvatar(
                                          backgroundImage: MemoryImage(image!)),
                                  title: Text(
                                      "${contact.name.first} ${contact.name.last}"),
                                  subtitle: Text(num),
                                  trailing:
                                      InkWell(child: Icon(Icons.more_vert)),
                                  onTap: () {
                                    _getcirclesApi(contact.phones.first.number
                                        .replaceAll(" ", "")
                                        .replaceAll("+91", ""));
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            // _isLoading ? CircularProgressIndicator() : SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _getcirclesApi(String Number) async {
    setState(() {
      _isLoading = true;
    });

    {
      var headers = {
        'DeviceID': '233a3fdefd94fa7c',
        'Cookie':
            'ASP.NET_SessionId=gg5uofsoxsrba1uv0egdcwrg; ASP.NET_SessionId=b4qkrzbfle40tws0hkysbufq'
      };
      Number = Number.replaceAll(" ", "");
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              'https://sonitechno.in/api/planapi.aspx?MethodName=operatorinfo&tel=$Number'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final data = json.decode(await response.stream.bytesToString());
        // ignore: non_constant_identifier_names
        Map<String, String> SearchDataList;
        if (data["records"]["status"].toString() == "1") {
          SearchDataList = {
            "Phone": Number,
            "operator": data["records"]["Operator"].toString(),
            "state": data["records"]["circle"].toString()
          };
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PlanRecharge_Screen(SearchData: SearchDataList),
              ));
        } else {
          SearchDataList = {"Phone": Number, "operator": "", "state": ""};
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PlanRecharge_Screen(SearchData: SearchDataList),
              ));
        }
        setState(() {
          _isLoading = false;
        });

        // ignore: use_build_context_synchronously

        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
      //  setState(() {
      //   _isLoading = false;
      // });
    }
  }
}
