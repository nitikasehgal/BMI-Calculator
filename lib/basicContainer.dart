import 'package:flutter/material.dart';

class basicContainer extends StatelessWidget {
  final Color colorchanger;
  final Widget? cardChild;
  final VoidCallback? onpress;

  basicContainer({required this.colorchanger, this.cardChild, this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorchanger,
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
