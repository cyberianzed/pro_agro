import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/image_constants.dart';
import 'package:get/get.dart';
import '../auth/signup_screen.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/color_constants.dart';
import '../../widgets/buttons.dart';
import '../../widgets/dividers.dart';
import '../../widgets/signup_textbutton.dart';

class LoginScreen extends StatelessWidget {
  // The TextEditingController's are used to manage the text in the TextFormFields.
  final email = TextEditingController();
  final password = TextEditingController();
// The name and username controllers are not used in this code snippet.
  final name = TextEditingController();
  final username = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Login"), backgroundColor: Colors.black26),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(ImageConstants.loginPagePic)),
              Padding(
// Padding for the entire column
                padding: const EdgeInsets.all(48),
                child: Column(
// Align the children of the column to the center
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                        secure: false,
                        controller: email,
                        label: "Email",
                        hintText: "Enter Your Email",
                        icon: Icons.email_outlined,
                        action: TextInputAction.next),
                    CustomTextField(
                        secure: true,
                        controller: password,
                        label: "Password",
                        hintText: "Enter Your Password",
                        icon: Icons.password,
                        action: TextInputAction.done),
// Login button that calls the login method in the AuthController with the email and password text
                    CustomButton(
                        label: "Login",
                        backgroundcolor: ColorConstants.mainColor,
                        textcolor: Colors.white,
                        function: () {
                          AuthController.instance.login(
                              email.text.toString(), password.text.toString());
                        }),

                    const Dividers(),
// Signup button that navigates to the SignUp page
                    SignUpText(function: () {
                      Get.to(SignUp());
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
