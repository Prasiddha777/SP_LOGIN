import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_token/controllers/token_controller.dart';
import 'package:new_token/screens/home_page.dart';
import 'package:new_token/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  SharedPreferencesToken sharedPreferencesToken = SharedPreferencesToken();

  //
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPreferencesToken.getUser().then((value) {
      if (value.token.toString() == 'null') {
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
        );
      }
    }).onError((error, stackTrace) {
      print('ERROR');
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: const Center(
        child: Icon(
          Icons.flutter_dash_sharp,
          color: Colors.white,
          size: 120,
        ),
      ),
    );
  }
}
