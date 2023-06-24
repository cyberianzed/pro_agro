import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_constants.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Lets Get Started",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: ColorConstants.mainColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Create account and login to explore the farmer in you !",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 116, 111, 111),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 45,
            ),
            SvgPicture.asset(ImageConstants.boardingScreen),
            const SizedBox(
              height: 48,
            ),
            BoardingButtons(
                textColor: Colors.white,
                label: "Login",
                function: () {
                  Get.to(()=>LoginScreen());
                },
                backgroundColor: ColorConstants.mainColor),
          ],
        ),
      ),
    );
  }
}

class BoardingButtons extends StatelessWidget {
  const BoardingButtons(
      {Key? key,
      required this.textColor,
      required this.label,
      required this.function,
      required this.backgroundColor})
      : super(key: key);

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                minimumSize: const Size(210, 47),
                maximumSize: const Size(210, 47),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: function,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.arrow_forward_ios_rounded)
              ],
            )),
        const SizedBox(height: 10),
      ],
    );
  }
}
