import 'package:flutter/material.dart';
import 'package:pro_agro/modules/pages/bookingpage/booking_profile_page.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking'),
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: pro.length,
              itemBuilder: (BuildContext context, int index) {
                return BookingProfilePage(
                  profile: pro[index],
                );
              },
            ),
          ],
        ));
  }
}

List<Profile> pro = [
  Profile(
    postTime: '10:00',
    profileName: 'Ronaldo Nazariyo',
  )
];
