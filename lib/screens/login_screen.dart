import 'package:flutter/material.dart';
import 'package:new_token/controllers/login_api_controller.dart';
import 'package:new_token/controllers/token_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  //
  final _login = LoginAPI();

  //token
  SharedPreferencesToken sharedPreferencesToken = SharedPreferencesToken();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
              onPressed: () {
                _login.login(
                    _emailController.text, _passController.text, context);
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
