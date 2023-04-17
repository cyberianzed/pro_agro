import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'login_screen.dart';
import '../../utils/color_constants.dart';
import '../../widgets/buttons.dart';
import '../../controllers/auth_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final username = TextEditingController();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Signup"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50, bottom: 50),
            child: Lottie.asset("assets/images/107800-login-leady.json"),
          ),
          CustomTextField(
            secure: false,
            controller: name,
            label: "Name",
            hintText: "Enter your Name",
            icon: Icons.person,
            action: TextInputAction.next,
          ),
          CustomTextField(
            secure: false,
            controller: username,
            label: "Username",
            hintText: "Enter your Username",
            icon: Icons.supervised_user_circle,
            action: TextInputAction.next,
          ),
          CustomTextField(
            secure: false,
            controller: email,
            label: "Email",
            hintText: "Enter your Email",
            icon: Icons.email_outlined,
            action: TextInputAction.next,
          ),
          CustomTextField(
            secure: true,
            controller: password,
            label: "Password",
            hintText: "Enter your Password",
            icon: Icons.password,
            action: TextInputAction.done,
            secondIcon: Icons.remove_red_eye_outlined,
          ),
          CustomButton(
              label: "Signup",
              backgroundcolor: ColorConstants.mainColor,
              textcolor: Colors.white,
              function: () {
                AuthController.instance.register(
                    email.text.toString(),
                    password.text.toString(),
                    name.text.toString(),
                    username.text.toString());
              }),
          CustomButton(
              label: "Login",
              backgroundcolor: ColorConstants.mainColor,
              textcolor: Colors.white,
              function: () {
                Get.to(LoginScreen());
              }),
        ],
      ).extendPadding(),
    );
  }
}

extension EPadding on Widget {
  Widget extendPadding() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: this,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.icon,
      required this.action,
      this.secondIcon,
      required this.secure})
      : super(key: key);

  final String label;
  final String hintText;
  final IconData icon;
  final IconData? secondIcon;
  final TextEditingController controller;
  final TextInputAction action;
  final bool secure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width * 100,
          height: 70,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: ColorConstants.textFieldsColor,
            child: TextFormField(
              textInputAction: action,
              controller: controller,
              obscureText: secure,
              decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                prefixIcon: Icon(icon),
                suffixIcon: Icon(secondIcon),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
