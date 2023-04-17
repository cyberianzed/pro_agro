import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key, required this.function}) : super(key: key);
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  )),
              TextButton(
                onPressed: function,
                child: const Text("Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF8142),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
