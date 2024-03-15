// // ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors

// import 'package:bype_techno_projects1/Globale_class/colors.dart';
// import 'package:bype_techno_projects1/add_bank_screen.dart';
// import 'package:bype_techno_projects1/dashboard_screen.dart';
// import 'package:bype_techno_projects1/my_profaile_screen.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class HomeNaveScreens extends StatefulWidget {
//   int index;
//   HomeNaveScreens({super.key, required this.index});
//   @override
//   _CurvedNavigationBarDemoState createState() =>
//       _CurvedNavigationBarDemoState();
// }

// class _CurvedNavigationBarDemoState extends State<HomeNaveScreens> {
//   int selectIndex = 0;
//   final List classes = <Widget>[
//     DashBord_Screen(),
//     // Setting_Screen(),
//     MyProfile_Screen(),
//     Add_BankScreen(),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     // ignore: unnecessary_null_comparison
//     DashBord_Screen();

//     if (widget.index != 0) {
//       selectIndex = widget.index;
//     }
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       selectIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: classes.elementAt(selectIndex),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         index: selectIndex,
//         height: 50.0,
//         items: <Widget>[
//           _buildNavItem(Icons.home, 'Home'),
//           _buildNavItem(Icons.search, 'Search'),
//           _buildNavItem(Icons.favorite, 'Favorite'),
//           _buildNavItem(Icons.settings, 'Settings'),
//           _buildNavItem(Icons.person, 'Person'),
//         ],
//         color: AppColors.Shadowwhitedark,
//         buttonBackgroundColor: Color.fromARGB(215, 241, 200, 222),
//         backgroundColor: Color.fromARGB(255, 199, 228, 243),
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 300),
//         onTap: (index) {
//           setState(() {
//             selectIndex = index;
//           });
//         },
//       ),
//     );
//   }


import 'package:flutter/material.dart';
import 'package:paytm_project_sonitecno2/dashboard_screen.dart';
import 'package:paytm_project_sonitecno2/my_profaile_screen.dart';
import 'package:paytm_project_sonitecno2/report_screen.dart';
import 'package:paytm_project_sonitecno2/serach_screen.dart';
import 'package:paytm_project_sonitecno2/support_screen.dart';

// ignore: must_be_immutable
class HomeNaveScreens extends StatefulWidget {
  int index;
  HomeNaveScreens({super.key, required this.index});

  @override
  State<HomeNaveScreens> createState() => _HomeNaveScreensState();
}

class _HomeNaveScreensState extends State<HomeNaveScreens> {
  int selectIndex = 0;
  final List classes = <Widget>[
    //  CackeFizeScreen(),
    DashBord_Screen(),
    SerachScreen(),
    Support_Screen(),
    ReportScreen(),
    MyProfile_Screen(),
  ];

  @override
  void initState() {
    super.initState();
    DashBord_Screen();
    if (widget.index != 0) {
      selectIndex = widget.index;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: classes.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.pink,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.support_outlined,
              // color: Colors.black,
            ),
            label: 'Support',
            // backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp
                // color: Colors.black,
                ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: Colors.black,
            ),
            label: 'Profile',
            // backgroundColor: Colors.white
          ),
        ],
        currentIndex: selectIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
