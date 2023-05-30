import 'package:get/get.dart';

class ProduceController extends GetxController {
  final produceList = <Produce>[].obs;
  final selectedFilterOptionIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch produce data from Firestore or any other data source
    fetchProduceData();
  }

  void fetchProduceData() {
    // Simulating fetching data from a data source
    final produceData = [
      Produce(
        name: 'Tomato',
        community: 'Farmers Community A',
        sowingMonth: 'February',
        harvestingMonth: 'March',
        harvestingProduceWeight: '5 kg',
      ),
      Produce(
        name: 'Carrot',
        community: 'Farmers Community B',
        sowingMonth: 'April',
        harvestingMonth: 'May',
        harvestingProduceWeight: '3 kg',
      ),
      Produce(
        name: 'Carrot',
        community: 'Farmers Community B',
        sowingMonth: 'January',
        harvestingMonth: 'May',
        harvestingProduceWeight: '3 kg',
      ),
      // Add more produce data as needed
    ];

    produceList.value = produceData;
  }

  List<Produce> get filteredProduces {
    final filterOption = selectedFilterOptionIndex.value;
    // Filter produce based on the selected option
    switch (filterOption) {
      case 1:
        return produceList
            .where((produce) => produce.harvestingMonth == 'March')
            .toList();
      case 2:
        return produceList
            .where((produce) => produce.harvestingMonth == 'April')
            .toList();
      case 3:
        return produceList
            .where((produce) => produce.harvestingMonth == 'May')
            .toList();
      default:
        return produceList;
    }
  }

  void selectFilterOption(int index) {
    selectedFilterOptionIndex.value = index;
  }
}

class Produce {
  final String name;
  final String community;
  final String sowingMonth;
  final String harvestingMonth;
  final String harvestingProduceWeight;

  Produce({
    required this.name,
    required this.community,
    required this.sowingMonth,
    required this.harvestingMonth,
    required this.harvestingProduceWeight,
  });
}
