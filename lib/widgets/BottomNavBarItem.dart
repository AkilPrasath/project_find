import 'package:flutter/material.dart';
import 'package:project_find/constants/colors.dart';

class BottomNavRadioItem extends StatelessWidget {
  const BottomNavRadioItem({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onClick,
    required this.name,
  }) : super(key: key);
  final String name;
  final bool selected;
  final IconData icon;
  final void Function() onClick;
//size: selected ? 35 : 30,
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Expanded(
            child: Icon(
                icon,
                color: selected ? kprimaryDarkColor : Colors.grey,
              size: selected ? 35 : 27,
              ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      onTap: onClick,
    );
  }
}
