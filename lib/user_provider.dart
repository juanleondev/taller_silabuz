import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserProvider({this.name, this.address});
  String? name;
  String? address;

  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}
