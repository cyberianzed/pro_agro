import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/auth/bottom_screens.dart';

class AuthController extends GetxController {
  // Singleton instance of the AuthController
  static AuthController instance = Get.find();

  // Rx variable to hold the current Firebase user
  late Rx<User?> _user;
  // FirebaseAuth instance to handle authentication
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    // Initialize _user with the current user
    _user = Rx<User?>(auth.currentUser);
    // Bind _user to the stream of user changes
    _user.bindStream(auth.userChanges());
    // Watch for changes in _user and call _initialPage
    ever(_user, _initialPage);

    // Initialize GetStorage
    GetStorage.init().then((_) {
      // Check for logged in user
      final box = GetStorage();
      final isLoggedIn = box.read('isLoggedIn') ?? false;
      if (isLoggedIn) {
        final email = box.read('email');
        Get.offAll(() => PersistentBottomView());
      } else {
        // Get.offAll(() => const BoardingScreen());
      }
    });
  }

  // Function to handle routing based on user status
  _initialPage(User? user) {
    if (user == null) {
      // If no user, navigate to login page
      print("Login Page");
      // Get.offAll(() => const BoardingScreen());
    } else {
      // If user is logged in, navigate to home screen
      print("Login Success");
      // Get.offAll(() => HomeScreen(
      //       email: user.email ?? "email null",
      // ));
      print('email = ${user.email}');

      // Save user information for persistence
      final box = GetStorage();
      box.write('isLoggedIn', true);
      box.write('email', user.email);
    }
  }

  // Function to handle registration
  void register(
      String email, String password, String name, String username) async {
    try {
      // Create user with email and password
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // Add user to Firestore database
        FirebaseFirestore.instance.collection('User').add({
          "Name": name,
          "Username": username,
          "Email": email,
          "Password": password,
        });
      });
    } catch (e) {
      // Show snackbar with error message
      print('fasf$e');
      Get.snackbar("title", "message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Login Again"));
    }
  }

  // Function to handle login
  void login(String email, String password) async {
    try {
      // Sign in with email and password
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // Show snackbar with error message
      Get.snackbar("Login ", "Login Failed",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Login Failed"));
    }
  }

  // Function to handle logout
  void logOut() async {
    await auth.signOut();

    // Remove user information for persistence
    final box = GetStorage();
    box.remove('isLoggedIn');
  }
}
