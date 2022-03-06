import 'package:flutter/material.dart';
import 'package:project_find/Admin/BottomNavEnum.dart';
import 'package:project_find/Admin/NavBarListener.dart';
import 'package:project_find/Admin/PendingScreen.dart';
import 'package:project_find/constants/colors.dart';
import 'package:project_find/widgets/BottomNavBar.dart';

import 'AdminHome.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    implements NavBarListener {
  late double height, width;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kprimaryLightColor,
      body: Container(
        height: height,
        width: width,
        color: kprimaryLightColor,
        child: Column(
          children: [
             Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                  AdminHome(   ),
                  AdminPending(),

              ]),
            ),
            NavBarComponent(navBarListener: this),
          ],
        ),
      ),
    );
  }

  @override
  void onChangeNavBarItem(BottomNavItem bottomNavItem) {
     if(bottomNavItem.index >1){
       return;
     }
    pageController.animateToPage(bottomNavItem.index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}



