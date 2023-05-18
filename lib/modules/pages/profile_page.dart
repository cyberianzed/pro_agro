import 'package:flutter/material.dart';
import 'package:pro_agro/utils/color_constants.dart';

import '../../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    // child: Image.asset('assets/images/profile2.jpg'),
                    child: const CircleAvatar(
                      backgroundColor: ColorConstants.green,
                    )),
              ),
              const SizedBox(height: 30),
              const Text(
                'Profile name',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'profilename@gmail.com',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
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
      ),
    );
  }
}
