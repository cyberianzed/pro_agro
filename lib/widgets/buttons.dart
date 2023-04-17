import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.backgroundcolor,
      required this.textcolor,
      required this.function});

  final String label;
  final Color backgroundcolor;
  final Color textcolor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundcolor,
              minimumSize: Size(Get.width * 0.80, 58),
              maximumSize: Size(Get.width * 0.80, 58),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 5,
            ),
            onPressed: function,
            child: Text(
              label,
              style: TextStyle(
                  color: textcolor, fontWeight: FontWeight.w500, fontSize: 20),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
