import 'package:flutter/material.dart';
import '../../../constans/app_constants.dart';
import '../model/user.dart';

/// FAKE USER SERVICE
// put all custom setup in RestApiService (duration timeout, exception handling , etc..)
// and extend restApiService, if you need custom service provider
class UserService {
  static final UserService _singleton = UserService._internal();

  factory UserService() {
    return _singleton;
  }
  UserService._internal();

  User getUserByID(String id) {
    if (_userA.id == id) {
      return _userA;
    } else {
      return _userB;
    }
  }

  final _userA = const User(
    id: "fwg123",
    name: "Anand Stores",
    country: "India",
    city: "Kottayam",
    profilImage: AssetImage(ImageRasterPath.market),
  );

  final _userB = const User(
    id: "fwg345",
    profilImage: AssetImage(ImageRasterPath.market2),
    name: "Agro Store",
    country: "India",
    city: "Ernakulam",
  );
}
