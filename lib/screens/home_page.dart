import 'package:flutter/material.dart';
import 'package:new_token/controllers/token_controller.dart';
import 'package:new_token/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HomePage'),
            SizedBox(
              height: 55,
            ),
            ElevatedButton(
              onPressed: () {
                SharedPreferencesToken sharedPreferencesToken =
                    SharedPreferencesToken();
                sharedPreferencesToken.removeUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    ));
  }
}
