library booking;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'booking_controller.dart';
import 'booking_details.dart';

part 'fab_booking.dart';

class BookingPage extends GetView<ProduceController> {
  BookingPage({Key? key}) : super(key: key);
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
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('booking').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          _produceController.produceList.clear();
          for (var doc in snapshot.data!.docs) {
            Produce produce = Produce.fromSnapshot(doc);
            _produceController.produceList.add(produce);
          }
          // Apply filter based on selected month
          int selectedMonthIndex =
              _produceController.selectedFilterOption.value;
          if (selectedMonthIndex > 0) {
            final selectedMonth = monthNames[selectedMonthIndex];
            _produceController.produceList.assignAll(_produceController
                .produceList
                .where((produce) => produce.harvestingMonth == selectedMonth)
                .toList());
          } else if (selectedMonthIndex == 0) {
            _produceController.produceList.assignAll(snapshot.data!.docs
                .map((doc) => Produce.fromSnapshot(doc))
                .toList());
          }

          return Obx(
            () => ListView.builder(
              itemCount: _produceController.produceList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailedBookingPage(
                            produce: _produceController.produceList[index],
                          );
                        },
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
                                _produceController.produceList[index].name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (GetStorage().read('isadmin') == true)
                                IconButton(
                                  onPressed: () {
                                    _deleteBooking(_produceController
                                        .produceList[index].adminContact);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Community: ${_produceController.produceList[index].community}',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Sowing Month: ${_produceController.produceList[index].sowingMonth}',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Harvesting Month: ${_produceController.produceList[index].harvestingMonth}',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Harvesting Produce Weight: ${_produceController.produceList[index].harvestingProduceWeight}',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: const _BookingFAB(),
    );
  }

  void _deleteBooking(String adminContact) {
    FirebaseFirestore.instance
        .collection('booking')
        .where('adminContact', isEqualTo: adminContact)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
      // Booking(s) deleted successfully
    }).catchError((error) {
      // Error occurred while deleting booking(s)
    });
  }

  Widget _monthFilterButtons() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            _produceController.update();
          },
          icon: const Icon(Icons.refresh_rounded),
          color: Colors.transparent,
        ),
        TextButton(
          child: const Text(
            'Filter by Month',
            style: TextStyle(color: Colors.blue),
          ),
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
        ),
      ],
    );
  }
}
