import 'package:flutter/cupertino.dart';

import 'BottomNavEnum.dart';

abstract class NavBarListener{
  void onChangeNavBarItem(BottomNavItem bottomNavItem);
}