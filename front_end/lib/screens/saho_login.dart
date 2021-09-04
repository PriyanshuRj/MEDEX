import 'package:flutter/material.dart';
import 'package:front_end/screens/home_page.dart';
import 'package:front_end/theme/colors/light_colors.dart';
import 'package:sawo/sawo.dart';
import 'dart:convert';
import 'package:camera/camera.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final CameraDescription? camera;
  _LoginScreenState({
    this.camera,
  });
  Sawo sawo = new Sawo(
    apiKey: "288d5890-9ea9-479c-b33d-1617f7382d0e",
    secretKey: "613354662f5bde7b00073aa3UGSL9dIDJU168YFSUYvQg7WN",
  );

  // user payload
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    } else {
      payload = json.decode(payload);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    setState(() {
      user = payload;
      print(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kDarkYellow,
        title: Text(
          "Login Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("UserData :- $user"),
              ElevatedButton(
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'email',
                    callback: payloadCallback,
                  );
                },
                child: Text('Email Login'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(LightColors.kDarkYellow),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'phone_number_sms',
                    callback: payloadCallback,
                  );
                },
                child: Text('Phone Login'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(LightColors.kDarkYellow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
