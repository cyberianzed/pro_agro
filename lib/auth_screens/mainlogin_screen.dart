import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../auth_screens/login_screen.dart';
import '../utils/image_constants.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({Key? key}) : super(key: key);

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
              Center(child: SvgPicture.asset(ImageConstants.LoginPagePic)),
              LoginPage()
            ],
          ),
        ),
      ),
    );
  }
}
