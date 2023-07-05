import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_token/controllers/token_controller.dart';
import 'package:new_token/models/token_models.dart';
import 'package:new_token/screens/home_page.dart';

class LoginAPI {
  //
  SharedPreferencesToken sharedPreferencesToken = SharedPreferencesToken();

  //
  Future<void> login(String? email, String pass, BuildContext context) async {
    try {
      final resp = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email.toString(),
          'password': pass.toString(),
        },
      );
      //if
      if (resp.statusCode == 200) {
        // final jsonDec = jsonDecode(resp.body);
        print('success');
        //token
        // print(resp.body);
        final decodedResp = jsonDecode(resp.body);
        print(decodedResp);
        sharedPreferencesToken
            .saveUser(
          TokenModel.fromJson(decodedResp),
        )
            .then((value) {
          print('FINAL SUCCESS =====>>>>>');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ));
        }).onError((error, stackTrace) {
          print('Error');
        });
      } else {
        print(resp.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
