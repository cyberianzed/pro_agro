import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pro_agro/controllers/auth_controller.dart';

class UserDetail {
  final String username;
  final String name;
  final String email;

  UserDetail({required this.username, required this.name, required this.email});
}

class UserDetailController extends GetxController {
  Future<String> getCurrentUser() async {
    return AuthController.instance.getCurrentUserUid();
  }

  Future<UserDetail?> getUserDetail(String userId) async {
    var snapshot =
        await FirebaseFirestore.instance.collection('User').doc(userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      UserDetail userDetail = UserDetail(
        username: snapshot.data()!['Username'],
        name: snapshot.data()!['Name'],
        email: snapshot.data()!['Email'],
      );

      return userDetail;
    }

    return null;
  }
  
}
