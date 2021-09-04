import 'package:flutter/material.dart';

import 'package:front_end/screens/upload_image.dart';
import 'package:front_end/screens/home_page.dart';
import 'package:front_end/screens/capture.dart';
import 'package:front_end/screens/comming_soon.dart';
import 'package:front_end/screens/upload2.dart';
import 'package:front_end/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: SingleChildScrollView(
        child: Column(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: LightColors.kDarkYellow,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'assets/images/avatar.png',
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Hey! User',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: LightColors.kDarkBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Welcome to MEDEX',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(Icons.home, color: Colors.black),
                label: Text("Home", style: TextStyle(color: Colors.black))),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.update,
                  color: Colors.black,
                ),
                label: Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.history, color: Colors.black),
                label: Text("History", style: TextStyle(color: Colors.black))),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CaptureImage(title: 'Image Picker Example')),
                  );
                },
                icon: Icon(Icons.add, color: Colors.black),
                label: Text("Upload Image",
                    style: TextStyle(color: Colors.black))),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CaptureImage(title: 'Image Picker Example')),
                  );
                },
                icon: Icon(Icons.camera, color: Colors.black),
                label: Text("Capture Image",
                    style: TextStyle(color: Colors.black))),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.logout, color: Colors.black),
                label: Text("Logout", style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
