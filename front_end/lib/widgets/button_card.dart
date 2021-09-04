import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final Color? cardColor;
  final String title;

  ButtonCard({
    this.cardColor,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
