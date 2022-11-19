import 'package:flutter/material.dart';

class iconContent extends StatelessWidget {
  final String text;
  final IconData icontype;
  iconContent(this.text, this.icontype);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icontype,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}
