import 'package:flutter/material.dart';
import 'package:front_end/screens/comming_soon.dart';
import 'package:front_end/screens/result.dart';

class ActiveProjectsCard extends StatelessWidget {
  final Color? cardColor;
  final String title;

  ActiveProjectsCard({
    this.cardColor,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CommingSoon()),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 200,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
