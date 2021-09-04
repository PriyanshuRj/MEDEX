import 'package:flutter/material.dart';
import 'package:front_end/screens/result.dart';

class UploadImageBox extends StatelessWidget {
  final Color? cardColor;
  final String title;
  final IconData? mainicon;

  UploadImageBox({
    this.cardColor,
    this.title = '',
    this.mainicon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 450,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(55.0),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(),
                      ));
                },
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.white60,
                  child: Icon(
                    mainicon,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'hello',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
