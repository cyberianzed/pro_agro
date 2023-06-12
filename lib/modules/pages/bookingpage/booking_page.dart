import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_agro/modules/pages/bookingpage/booking_controller.dart';

class BookingPage extends StatelessWidget {
  final ProduceController produceController = Get.put(ProduceController());

  BookingPage({Key? key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createBooking(context);
        },
        child: const Icon(Icons.add),
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
              backgroundColor:
                  produceController.selectedFilterOptionIndex.value == 1
                      ? MaterialStateProperty.all<Color>(Colors.green)
                      : null,
            ),
            child: const Text('March'),
          ),
          const SizedBox(width: 5.0),
          ElevatedButton(
            onPressed: () => produceController.selectFilterOption(2),
            style: ButtonStyle(
              backgroundColor:
                  produceController.selectedFilterOptionIndex.value == 2
                      ? MaterialStateProperty.all<Color>(Colors.green)
                      : null,
            ),
            child: const Text('April'),
          ),
          const SizedBox(width: 5.0),
          ElevatedButton(
            onPressed: () => produceController.selectFilterOption(3),
            style: ButtonStyle(
              backgroundColor:
                  produceController.selectedFilterOptionIndex.value == 3
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

  void _createBooking(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String community = '';
        String sowingMonth = '';
        String harvestingMonth = '';
        String harvestingProduceWeight = '';

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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final produce = Produce(
                  name: name,
                  community: community,
                  sowingMonth: sowingMonth,
                  harvestingMonth: harvestingMonth,
                  harvestingProduceWeight: harvestingProduceWeight,
                );
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

  const ProduceCard({Key? key, required this.produce});

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
