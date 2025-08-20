import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  const CoustomButton({
    super.key,
    required this.onTap,
    required this.titleButton,
  });

  final GestureTapCallback onTap;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffF08A4B),
        ),
        child: Center(
          child: Text(
            titleButton,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
