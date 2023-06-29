import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pro_agro/model/user_data.dart';
import 'package:pro_agro/modules/auth/login_screen.dart';
import '../modules/pages/botomscreen/bottom_screens.dart';

class AuthController extends GetxController {
  // Singleton instance of the AuthController
  static AuthController instance = Get.find();

  // Rx variable to hold the current Firebase user
  late Rx<User?> _user;
  // FirebaseAuth instance to handle authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  UserDetail? userdet;
  UserDetailController userDetailController = Get.put(UserDetailController());

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
      // final box = GetStorage();
      // final isLoggedIn = box.read('isLoggedIn') ?? false;

      // if (isLoggedIn) {
      // final email = box.read('email');
      // Get.offAll(() => PersistentBottomView());
      // } else {
      // Get.offAll(() => const BoardingScreen());
      // }
    });
  }

  // Function to handle routing based on user status
  _initialPage(User? user) async {
    final box = GetStorage();

    if (user == null) {
      // If no user, navigate to login page
      debugPrint("Login Page");
      // Get.offAll(() => const BoardingScreen());
    } else {
      // If user is logged in, navigate to home screen
      debugPrint("Login Success");
      await userDetailController.getCurrentUser().then((userId) {
        if (userId != null) {
          userDetailController.getUserDetail(userId).then((userDetail) {
            if (userDetail != null) {
              box.write('name', userDetail.name);
              box.write('username', userDetail.username);
              box.write('isadmin', userDetail.isAdmin);
              if (userDetail.isAdmin) {
                // Navigate to admin screen
                debugPrint('adminnnnnnnnnnnnn');
              } else {
                debugPrint('noo admin');
                // Navigate to user screen
              }
            } else {
              // Handle case when user detail is null
              debugPrint('User details not found');
            }
          });
        } else {
          // Handle case when user ID is null
          debugPrint('No user ID available');
        }
      });

      // Save user information for persistence
      box.write('isLoggedIn', true);
      box.write('email', user.email);
    }
  }

  // Function to handle registration
  void register(
      String email, String password, String name, String username) async {
    try {
      // Create user with email and password
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the newly created user's UID
      final uid = userCredential.user?.uid;

      if (uid != null) {
        // Create a reference to the 'User' collection and set the user details with the UID as the document ID
        final userRef = FirebaseFirestore.instance.collection('User').doc(uid);
        await userRef.set({
          'Name': name,
          'Username': username,
          'Email': email,
          'Password': password,
          'admin': false,
        });

        login(email, password);
      }
    } catch (e) {
      // Show snackbar with error message
      debugPrint('Error during registration: $e');
      Get.snackbar(
        'Registration Error',
        'An error occurred during registration.',
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Registration Error'),
      );
    }
  }

  // Function to handle login
  void login(String email, String password) async {
    try {
      // Sign in with email and password
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _user.value = auth.currentUser;
      Get.offAll(() => PersistentBottomView());
    } catch (e) {
      // Show snackbar with error message
      Get.snackbar(
        'Login Failed',
        'An error occurred during login.',
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Login Failed'),
      );
    }
  }

  String getCurrentUserUid() {
    final user = _user.value;
    if (user != null) {
      return user.uid;
    }
    return '';
  }

  // Function to handle logout
  void logOut() async {
    await auth.signOut();

    // Remove user information for persistence
    final box = GetStorage();
    box.remove('isLoggedIn');
    Get.offAll(() => LoginScreen());
  }
}
