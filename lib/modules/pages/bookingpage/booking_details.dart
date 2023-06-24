import 'package:flutter/material.dart';
import 'package:pro_agro/modules/pages/homepage/app/features/product/views/screens/product_detail_screen.dart';
import 'booking_controller.dart';

class DetailedBookingPage extends StatelessWidget {
  final Produce produce;

  const DetailedBookingPage({super.key, required this.produce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff0f4f7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
         title: Text(
          produce.name,
          style: const TextStyle(
            color: Colors.black,
          ),
        )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Farmer Name : ${produce.farmerName}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Farmer Contact: ${produce.farmerContact}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Rating(produce.rating)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Contact Admin: ${produce.adminContact}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Community: ${produce.community}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sowing Month: ${produce.sowingMonth}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Harvesting Month: ${produce.harvestingMonth}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Harvesting Produce Weight: ${produce.harvestingProduceWeight}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Description: ${produce.description}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
