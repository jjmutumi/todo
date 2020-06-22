import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/user.dart';
import 'package:todo/services/authentication_service.dart';

class SharedPreferencesAuthenticationService extends AuthenticationService {
  @override
  Future<User> currentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString("USER");
    if (userString != null && userString.isNotEmpty) {
      try {
        return User.fromJson(jsonDecode(userString));
      } catch (err) {
        print("$err");
      }
    }
    return null;
  }

  @override
  signIn(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userString = jsonEncode(user.toJson());
    await prefs.setString("USER", userString);
  }

  @override
  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
