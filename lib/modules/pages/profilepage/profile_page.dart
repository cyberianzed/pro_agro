import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_agro/controllers/auth_controller.dart';
import 'package:pro_agro/model/user_data.dart';
import 'package:pro_agro/modules/pages/profilepage/update_profile_screen.dart';

class ProfilePage extends StatelessWidget {
  final UserDetailController _userDetailController = Get.put(UserDetailController());


  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 1.5,
      ),
      body: FutureBuilder<UserDetail?>(
        future: _fetchUserDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: TextButton(
                onPressed: () {
                  AuthController.instance.logOut();
                },
                child: const Text('logout'),
              ),
            );
          } else if (snapshot.data != null) {
            final userDetail = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    Text(
                      userDetail.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      userDetail.email,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const UpdateProfileScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.account_circle,
                          color: Colors.green, // Set the icon color to green
                        ),
                      ),
                      title: const Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.credit_card,
                          color: Colors.green, // Set the icon color to green
                        ),
                      ),
                      title: const Text(
                        'Billing Details',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.green, // Set the icon color to green
                        ),
                      ),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      onTap: () {
                        AuthController.instance.logOut();
                      },
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.logout,
                          color: Colors.green, // Set the icon color to green
                        ),
                      ),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('User details not available'),
            );
          }
        },
      ),
    );
  }

  Future<UserDetail?> _fetchUserDetail() async {
    final currentUser = await _userDetailController.getCurrentUser();
    final userDetail = await _userDetailController.getUserDetail(currentUser);
    return userDetail;
  }
}
