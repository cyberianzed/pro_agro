import 'package:flutter/material.dart';

class Profile {
  final String profileName;
  final String postTime;

  Profile({
    required this.profileName,
    required this.postTime,
  });
}

class BookingProfilePage extends StatelessWidget {
  final Profile profile;

  const BookingProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, border: Border()),
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const CircleAvatar()),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              profile.profileName,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              profile.postTime,
              style: TextStyle(color: Colors.grey[300]),
            ),
          ],
        )
      ],
    );
  }
}
