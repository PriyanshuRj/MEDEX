import 'package:flutter/material.dart';
import 'package:front_end/screens/upload_image.dart';

import 'package:front_end/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:front_end/widgets/active_project_card.dart';
import 'package:front_end/widgets/button_card.dart';
import 'package:front_end/widgets/top_container.dart';
import 'package:front_end/widgets/drawer.dart';

import 'package:front_end/screens/comming_soon.dart';

class HomePage extends StatelessWidget {
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
      appBar: AppBar(
        backgroundColor: LightColors.kDarkYellow,
        // leading: Icon(Icons.menu, color: LightColors.kDarkBlue, size: 30.0),
        elevation: 0,
        // bottom: Icon(Icons.search, color: LightColors.kDarkBlue, size: 25.0),
        actions: [
          // Icon(Icons.search, color: LightColors.kDarkBlue, size: 25.0),
        ],
        iconTheme: IconThemeData(color: LightColors.kDarkBlue),
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 140,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  // "UserData :- $users",
                                  "Hey! User",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Welcome',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kGreen,
                                title: 'Update Profile',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                title: 'History',
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UploadImage()),
                              );
                            },
                            child: Row(children: <Widget>[
                              ButtonCard(
                                cardColor: LightColors.kBlue,
                                title: 'Upload Image',
                              ),
                            ]),
                          ),
                          SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommingSoon()),
                              );
                            },
                            child: Row(children: <Widget>[
                              ButtonCard(
                                cardColor: LightColors.kBlue,
                                title: 'Capture Image',
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
