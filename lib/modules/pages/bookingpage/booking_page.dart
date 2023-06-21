import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_agro/modules/pages/bookingpage/booking_controller.dart';
import 'package:pro_agro/model/user_data.dart';
import 'package:pro_agro/controllers/auth_controller.dart';
import 'booking_details.dart';

class BookingPage extends StatelessWidget {
  final ProduceController produceController = Get.put(ProduceController());
  final String localAdmin = '82837473292';

  BookingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xfff0f4f7),
        appBar: AppBar(
            backgroundColor: Color(0xfff0f4f7),
            elevation: 0,
            leadingWidth: 250,
            actions: [Center(child: _monthFilterButtons())],
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              child: Text(
                'Bookings',
                style: TextStyle(
                    color: Color.fromARGB(255, 69, 51, 51),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
        body: Column(
          children: [
            // _monthFilterButtons(),
            Expanded(child: Obx(() => _buildProduceList())),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _createBooking(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _monthFilterButtons() {
    const List<String> monthNames = [
      'All',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Column(
      children: [
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: Get.context!,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List<Widget>.generate(monthNames.length, (index) {
                      final monthName = monthNames[index];
                      return ListTile(
                        title: Text(monthName),
                        onTap: () {
                          produceController.selectFilterOption(index);
                          Get.back();
                        },
                      );
                    }),
                  ),
                );
              },
            );
          },
          child: Text('Filter by Month', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  Widget _buildProduceList() {
    return ListView.builder(
      itemCount: produceController.filteredProduces.length,
      itemBuilder: (context, index) {
        final produce = produceController.filteredProduces[index];
        return ProduceCard(
          produce: produce,
          onDelete: () {
            produceController.removeProduce(produce);
          },
        );
      },
    );
  }

  void _createBooking(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String community = '';
        String sowingMonth = '';
        String harvestingMonth = '';
        String harvestingProduceWeight = '';
        String contactNo = '';
        String description = '';

        return AlertDialog(
          title: const Text('Create Booking'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => name = value,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                onChanged: (value) => community = value,
                decoration: const InputDecoration(
                  labelText: 'Community',
                ),
              ),
              TextField(
                onChanged: (value) => sowingMonth = value,
                decoration: const InputDecoration(
                  labelText: 'Sowing Month',
                ),
              ),
              TextField(
                onChanged: (value) => harvestingMonth = value,
                decoration: const InputDecoration(
                  labelText: 'Harvesting Month',
                ),
              ),
              TextField(
                onChanged: (value) => harvestingProduceWeight = value,
                decoration: const InputDecoration(
                  labelText: 'Harvesting Produce Weight',
                ),
              ),
              TextField(
                onChanged: (value) => contactNo = value,
                decoration: const InputDecoration(
                  labelText: 'Contact Number ',
                ),
              ),
              TextField(
                onChanged: (value) => description = value,
                decoration: const InputDecoration(
                  labelText: 'Description of the Product',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                var userDetail;
                final produce = Produce(
                    name: name,
                    rating: (Random().nextDouble() * 5).toPrecision(1),
                    community: community,
                    sowingMonth: sowingMonth,
                    harvestingMonth: harvestingMonth,
                    harvestingProduceWeight: harvestingProduceWeight,
                    adminContact: localAdmin,
                    //TODO USERDETAIL
                    // farmerName: userDetail.username,
                    farmerName: 'Farmer 0',
                    farmerContact: contactNo,
                    description: description);
                produceController.addProduce(produce);
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class ProduceCard extends StatelessWidget {
  final Produce produce;
  final VoidCallback onDelete;

  const ProduceCard({Key? key, required this.produce, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedBookingPage(produce: produce),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    produce.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                'Community: ${produce.community}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Sowing Month: ${produce.sowingMonth}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Harvesting Month: ${produce.harvestingMonth}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Harvesting Produce Weight: ${produce.harvestingProduceWeight}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
