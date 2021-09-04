import 'package:flutter/material.dart';
import 'package:front_end/theme/colors/light_colors.dart';
import 'package:front_end/screens/saho_login.dart';
import 'package:flutter/services.dart';

void main() {
  // Obtain a list of the available cameras on the device.

  // Get a specific camera from the list of available cameras.

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: LightColors.kDarkBlue,
            displayColor: LightColors.kDarkBlue,
            fontFamily: 'Poppins'),
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
