import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_controller.dart';

class BookingPage extends StatelessWidget {
  final ProduceController produceController = Get.put(ProduceController());

  BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Page'),
      ),
      body: Column(
        children: [
          Obx(() => _buildFilterButtons()),
          Expanded(child: Obx(() => _buildProduceList())),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => produceController.selectFilterOption(1),
            style: ButtonStyle(
              backgroundColor: Get.find<ProduceController>()
                          .selectedFilterOptionIndex
                          .value ==
                      1
                  ? MaterialStateProperty.all<Color>(Colors.green)
                  : null,
            ),
            child: const Text('March'),
          ),
          const SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () => produceController.selectFilterOption(2),
            style: ButtonStyle(
              backgroundColor: Get.find<ProduceController>()
                          .selectedFilterOptionIndex
                          .value ==
                      2
                  ? MaterialStateProperty.all<Color>(Colors.green)
                  : null,
            ),
            child: const Text('April'),
          ),
          const SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () => produceController.selectFilterOption(3),
            style: ButtonStyle(
              backgroundColor: Get.find<ProduceController>()
                          .selectedFilterOptionIndex
                          .value ==
                      3
                  ? MaterialStateProperty.all<Color>(Colors.green)
                  : null,
            ),
            child: const Text('May'),
          ),
          // Add more filter buttons for other months
        ],
      ),
    );
  }

  Widget _buildProduceList() {
    return ListView.builder(
      itemCount: produceController.filteredProduces.length,
      itemBuilder: (context, index) {
        final produce = produceController.filteredProduces[index];
        return ProduceCard(produce: produce);
      },
    );
  }
}

class ProduceCard extends StatelessWidget {
  final Produce produce;

  const ProduceCard({super.key, required this.produce});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produce.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
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
    );
  }
}
