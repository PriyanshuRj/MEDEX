import 'package:flutter/material.dart';
import 'package:front_end/theme/colors/light_colors.dart';
import 'package:sawo/sawo.dart';

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
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
      Sawo sawo = new Sawo(
        apiKey: "288d5890-9ea9-479c-b33d-1617f7382d0e",
        secretKey: "613354662f5bde7b00073aa3UGSL9dIDJU168YFSUYvQg7WN",
     );

     // user payload
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sawo"),
          centerTitle: true,
        ),
      body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UserData :- $user"),
            ElevatedButton(
              onPressed: () {
                sawo.signIn(
                  context: context,
                  identifierType: 'email',
                  callback: payloadCallback,
                );
              },
              child: Text('Email Login'),
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
            ),
          ],
        ),
      ),
    ),
    );
  }
}