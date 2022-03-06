import 'package:flutter/material.dart';
import 'package:project_find/Admin/BottomNavEnum.dart';
import 'package:project_find/Admin/NavBarListener.dart';
import 'package:project_find/widgets/BottomNavBarItem.dart';

class NavBarComponent extends StatefulWidget {
  const NavBarComponent({Key? key, required this.navBarListener});

  final NavBarListener navBarListener;

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  late double width;
  BottomNavItem selectedRadio = BottomNavItem.HOME;

  void changeSelectedNavItem(BottomNavItem newItem) {
    setState(() {
      selectedRadio = newItem;
    });
    widget.navBarListener.onChangeNavBarItem(newItem);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavRadioItem(
            name: "Home",
            icon: Icons.home_filled,
            selected: selectedRadio == BottomNavItem.HOME,
            onClick: () {
              changeSelectedNavItem(BottomNavItem.HOME);
            },
          ), //home
          BottomNavRadioItem(
            name: "Pending",
            icon: Icons.timer,
            selected: selectedRadio == BottomNavItem.PENDING,
            onClick: () {
              changeSelectedNavItem(BottomNavItem.PENDING);
            },
          ), // pending
          BottomNavRadioItem(
            name: "Cases",
            icon: Icons.insert_drive_file,
            selected: selectedRadio == BottomNavItem.CASES,
            onClick: () {
              changeSelectedNavItem(BottomNavItem.CASES);
            },
          ), // cases
          BottomNavRadioItem(
            name: "Profile",
            icon: Icons.person,
            selected: selectedRadio == BottomNavItem.PROFILE,
            onClick: () {
              changeSelectedNavItem(BottomNavItem.PROFILE);
            },
          ),
        ],
      ),
    );
  }
}