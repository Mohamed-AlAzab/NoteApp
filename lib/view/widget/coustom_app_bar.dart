import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff262626),
      title: Text(
        'Note App',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
