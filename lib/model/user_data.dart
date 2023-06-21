import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserDetail {
  final String username;
  final String name;
  final String email;
  final bool isAdmin;

  UserDetail({
    required this.username,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  factory UserDetail.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    return UserDetail(
      username: snapshot.data()!['Username'],
      name: snapshot.data()!['Name'],
      email: snapshot.data()!['Email'],
      isAdmin: snapshot.data()!['admin'] ?? false,
    );
  }
}

class UserDetailController extends GetxController {
  Future<String?> getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  Future<UserDetail?> getUserDetail(String userId) async {
    var snapshot =
        await FirebaseFirestore.instance.collection('User').doc(userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      UserDetail userDetail = UserDetail.fromSnapshot(snapshot);
      return userDetail;
    }
    return null;
  }
}
