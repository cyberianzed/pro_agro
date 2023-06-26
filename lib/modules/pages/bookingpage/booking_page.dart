import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'booking_controller.dart';
import 'booking_details.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});
  final ProduceController _produceController = Get.put(ProduceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xfff0f4f7),
          elevation: 0,
          leadingWidth: 250,
          actions: [Center(child: _monthFilterButtons())],
          leading: const Padding(
            padding: EdgeInsets.only(
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('booking').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<Produce> produceList = [];
          for (var doc in snapshot.data!.docs) {
            Produce produce = Produce.fromSnapshot(doc);
            produceList.add(produce);
          }

          // Apply filter based on selected harvest month
          List<Produce> filteredProduceList = produceList;
          int selectedMonthIndex =
              _produceController.selectedFilterOption.value;
          if (selectedMonthIndex > 0 &&
              selectedMonthIndex < monthNames.length) {
            String selectedMonth = monthNames[selectedMonthIndex];
            filteredProduceList = produceList
                .where((produce) => produce.harvestingMonth == selectedMonth)
                .toList();
          }

          return ListView.builder(
            itemCount: filteredProduceList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredProduceList[index].name),
                subtitle: Text(filteredProduceList[index].community),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailedBookingPage(
                            produce: filteredProduceList[index]);
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController nameController = TextEditingController();
              TextEditingController communityController =
                  TextEditingController();
              TextEditingController sowingMonthController =
                  TextEditingController();
              TextEditingController harvestingMonthController =
                  TextEditingController();
              TextEditingController harvestingProduceWeightController =
                  TextEditingController();
              TextEditingController farmerNameController =
                  TextEditingController();
              TextEditingController farmerContactController =
                  TextEditingController();
              TextEditingController adminContactController =
                  TextEditingController();
              TextEditingController descriptionController =
                  TextEditingController();
              TextEditingController adminNameController =
                  TextEditingController();

              return AlertDialog(
                title: const Text('Create Booking'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: communityController,
                        decoration:
                            const InputDecoration(labelText: 'Community'),
                      ),
                      TextField(
                        controller: sowingMonthController,
                        decoration:
                            const InputDecoration(labelText: 'Sowing Month'),
                      ),
                      TextField(
                        controller: harvestingMonthController,
                        decoration: const InputDecoration(
                            labelText: 'Harvesting Month'),
                      ),
                      TextField(
                        controller: harvestingProduceWeightController,
                        decoration: const InputDecoration(
                            labelText: 'Harvesting Produce Weight'),
                      ),
                      TextField(
                        controller: farmerNameController,
                        decoration:
                            const InputDecoration(labelText: 'Farmer Name'),
                      ),
                      TextField(
                        controller: farmerContactController,
                        decoration:
                            const InputDecoration(labelText: 'Farmer Contact'),
                      ),
                      TextField(
                        controller: adminContactController,
                        decoration:
                            const InputDecoration(labelText: 'Admin Contact'),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                      TextField(
                        controller: adminNameController,
                        decoration:
                            const InputDecoration(labelText: 'Admin Name'),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      // Save the produce data to Firestore
                      Produce produce = Produce(
                        name: nameController.text,
                        adminName: adminNameController.text,
                        community: communityController.text,
                        sowingMonth: sowingMonthController.text,
                        harvestingMonth: harvestingMonthController.text,
                        harvestingProduceWeight:
                            harvestingProduceWeightController.text,
                        farmerName: farmerNameController.text,
                        farmerContact: farmerContactController.text,
                        adminContact: adminContactController.text,
                        rating: (Random().nextDouble() * 5).toPrecision(1),
                        description: descriptionController.text,
                      );
                      FirebaseFirestore.instance
                          .collection('booking')
                          .add(produce.toMap());

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
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
                          _produceController.selectFilterOption(index);
                          Get.back();
                        },
                      );
                    }),
                  ),
                );
              },
            );
          },
          child: const Text(
            'Filter by Month',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
