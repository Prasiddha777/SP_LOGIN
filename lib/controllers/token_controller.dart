import 'package:new_token/models/token_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesToken {
  Future<bool> saveUser(TokenModel tokenModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', tokenModel.token.toString());
    return true;
  }

  Future<TokenModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return TokenModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
