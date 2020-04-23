import 'package:flower_explorer/assets/color_schemes.dart';
import 'package:flower_explorer/assets/type_family.dart';
import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const MyCustomAppBar({
    Key key,
    @required this.height,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 20.0,
      ),
      child: Center(
        child: Text(
          title,
          style: logoStyle,
        ),
      ),
      decoration: BoxDecoration(
        color: abColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
