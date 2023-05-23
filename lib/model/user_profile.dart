import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pro_agro/controllers/auth_controller.dart';

class UserDetail {
  final String username;
  final String name;
  final String email;

  UserDetail({required this.username, required this.name, required this.email});
}

class UserDetailRepository {
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

    Future<String?> uploadProfilePicture(File imageFile, String userId) async {
    try {
      // Create a reference to the location where the image will be stored in Firebase Storage
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_pictures/$userId.jpg');

      // Upload the image file to Firebase Storage
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      // Retrieve the download URL of the uploaded image
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print('Error uploading profile picture: $e');
      return null;
    }
  }

}
