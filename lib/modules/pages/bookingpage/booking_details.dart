import 'package:flutter/material.dart';
import 'booking_controller.dart';

class DetailedBookingPage extends StatelessWidget {
  final Produce produce;

  const DetailedBookingPage({super.key, required this.produce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Booking Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${produce.name}'),
            Text('Community: ${produce.community}'),
            Text('Sowing Month: ${produce.sowingMonth}'),
            Text('Harvesting Month: ${produce.harvestingMonth}'),
            Text(
                'Harvesting Produce Weight: ${produce.harvestingProduceWeight}'),
            Text('Farmer Name: ${produce.farmerName}'),
            Text('Farmer Contact: ${produce.farmerContact}'),
            Text('Admin Contact: ${produce.adminContact}'),
            Text('Rating: ${produce.rating}'),
            Text('Description: ${produce.description}'),
            Text('Admin Name: ${produce.adminName}'),
          ],
        ),
      ),
    );
  }
}
