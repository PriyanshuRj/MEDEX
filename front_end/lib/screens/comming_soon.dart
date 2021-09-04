import 'package:flutter/material.dart';
import 'package:front_end/screens/upload_image.dart';

import 'package:front_end/theme/colors/light_colors.dart';

class CommingSoon extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: Center(
        child: Text("Comming soon!!",
            style: TextStyle(
              color: LightColors.kDarkBlue,
              fontWeight: FontWeight.w200,
              fontSize: 32.0,
            )),
      ),
    );
  }
}
