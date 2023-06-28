part of booking;

class _BookingFAB extends StatelessWidget {
  const _BookingFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController nameController = TextEditingController();
            TextEditingController communityController = TextEditingController();
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
            TextEditingController adminNameController = TextEditingController();

            return AlertDialog(
              title: const Text('Create Booking'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Crop Name'),
                    ),
                    TextField(
                      controller: communityController,
                      decoration: const InputDecoration(labelText: 'Community'),
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
                      controller: adminNameController,
                      decoration:
                          const InputDecoration(labelText: 'Admin Name'),
                    ),
                    TextField(
                      controller: adminContactController,
                      decoration:
                          const InputDecoration(labelText: 'Admin Contact'),
                    ),
                    TextField(
                      controller: sowingMonthController,
                      decoration:
                          const InputDecoration(labelText: 'Sowing Month'),
                    ),
                    TextField(
                      controller: harvestingMonthController,
                      decoration:
                          const InputDecoration(labelText: 'Harvesting Month'),
                    ),
                    TextField(
                      controller: harvestingProduceWeightController,
                      decoration: const InputDecoration(
                          labelText: 'Harvesting Produce Weight'),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
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
    );
  }
}
