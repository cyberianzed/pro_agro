import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<String> monthNames = [
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

class ProduceController extends GetxController {
  final CollectionReference producesCollection =
      FirebaseFirestore.instance.collection('booking');

  TextEditingController nameController = TextEditingController();

  Stream<QuerySnapshot> getProduces() {
    return producesCollection.snapshots();
  }

  RxList<Produce> produceList = <Produce>[].obs;
  RxInt selectedFilterOption = 0.obs;

  void selectFilterOption(int index) {
    selectedFilterOption.value = index;
    debugPrint("index : $index");
    // update();
  }

  void updates() {
    update([22]);
  }

  List<Produce> getFilteredProduces() {
    if (selectedFilterOption.value == 0) {
      // Return all produces if "All" is selected
      return produceList.toList();
    } else {
      final selectedMonth = monthNames[selectedFilterOption.value];
      // Filter produces based on selected harvest month
      return produceList
          .where((produce) => produce.harvestingMonth == selectedMonth)
          .toList();
    }
  }
}

class Produce {
  final String name;
  final String community;
  final String sowingMonth;
  final String harvestingMonth;
  final String harvestingProduceWeight;
  final String farmerName;
  final String farmerContact;
  final String adminContact;
  final double rating;
  final String description;
  final String adminName;

  Produce({
    required this.name,
    required this.adminName,
    required this.community,
    required this.sowingMonth,
    required this.harvestingMonth,
    required this.harvestingProduceWeight,
    required this.farmerName,
    required this.farmerContact,
    required this.adminContact,
    required this.rating,
    required this.description,
  });

  factory Produce.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Produce(
      name: data['name'],
      community: data['community'],
      sowingMonth: data['sowingMonth'],
      harvestingMonth: data['harvestingMonth'],
      harvestingProduceWeight: data['harvestingProduceWeight'],
      farmerName: data['farmerName'],
      farmerContact: data['farmerContact'],
      adminContact: data['adminContact'],
      rating: data['rating'],
      description: data['description'],
      adminName: data['adminName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'community': community,
      'sowingMonth': sowingMonth,
      'harvestingMonth': harvestingMonth,
      'harvestingProduceWeight': harvestingProduceWeight,
      'farmerName': farmerName,
      'farmerContact': farmerContact,
      'adminContact': adminContact,
      'rating': rating,
      'description': description,
      'adminName': adminName,
    };
  }
}
