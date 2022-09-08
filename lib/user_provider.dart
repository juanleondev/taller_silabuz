import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  UserProvider({this.name, this.address});
  String? name;
  String? address;
  final storage = const FlutterSecureStorage();
  static const String _tokenKey = '__tokenKey__';
  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return storage.read(key: _tokenKey);
  }

  Future<bool> isTokenValid() async {
    final token = await getToken();
    if (token == null) return false;
    var jwt = token.split(".");

    if (jwt.length != 3) {
      return false;
    } else {
      var payload =
          json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
      final expirationDate =
          DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000);
      if (expirationDate.isAfter(DateTime.now())) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> login(String email, String password) async {
    final url = Uri.https('api.escuelajs.co', 'api/v1/auth/login');
    final response =
        await http.post(url, body: {"email": email, "password": password});

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      final token = result['access_token'];
      await saveToken(token);
      bool isProfileLoaded = await loadProfile();

      return isProfileLoaded;
    }
    return false;
  }

  Future<bool> loadProfile() async {
    final token = await storage.read(key: _tokenKey);
    final url = Uri.https('api.escuelajs.co', 'api/v1/auth/profile');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      name = result['name'];
      return true;
    }
    return false;
  }
}
