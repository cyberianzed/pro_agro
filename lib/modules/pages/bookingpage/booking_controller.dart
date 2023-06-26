import 'package:get/get.dart';

class ProduceController extends GetxController {
  final produceList = <Produce>[].obs;
  final selectedFilterOptionIndex = 0.obs;
  final String localAdmin = '82837473292';

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
          adminContact: localAdmin,
          farmerName: 'Mathew Abaraham',
          farmerContact: '8392482946',
          rating: 3,
          description:
              'The tomato (/təmeɪtoʊ/ or /təmɑːtoʊ/) is the edible berry of the plant Solanum lycopersicum,[1][2] commonly known as the tomato plant. The species originated in western South America, Mexico, and Central America.[2][3] The Nahuatl word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived.[3][4] Its domestication and use as a cultivated food may have originated with the indigenous peoples of Mexico.[2][5] The Aztecs used tomatoes in their cooking at the time of the Spanish conquest of the Aztec Empire, and after the Spanish encountered the tomato for the first time after their contact with the Aztecs, they brought the plant to Europe, in a widespread transfer of plants known as the Columbian exchange. From there, the tomato was introduced to other parts of the European-colonized world during the 16th century.[2]',
          adminName: 'ja'),

      Produce(
        name: 'Carrot',
        community: 'Farmers Community B',
        sowingMonth: 'April',
        harvestingMonth: 'May',
        harvestingProduceWeight: '3 kg',
        farmerName: 'Rajesh',
        adminContact: localAdmin,
        farmerContact: '9038504702',
        rating: 4.4,
        description: 'Carrots',
        adminName: 's',
      ),

      Produce(
          name: 'Carrot',
          community: 'Farmers Community B',
          sowingMonth: 'January',
          harvestingMonth: 'May',
          harvestingProduceWeight: '3 kg',
          farmerName: 'Shaji',
          farmerContact: '9364036254',
          adminContact: localAdmin,
          rating: 2.8,
          description: 'Carrots',
          adminName: 'afs'),
      // Add more produce data as needed
    ];

    produceList.value = produceData;
  }

  List<Produce> get filteredProduces {
    final filterOption = selectedFilterOptionIndex.value;
    // Filter produce based on the selected option
    switch (filterOption) {
      case 0:
        return produceList.toList();
      case 1:
        return produceList
            .where((produce) => produce.harvestingMonth == 'January')
            .toList();
      case 2:
        return produceList
            .where((produce) => produce.harvestingMonth == 'February')
            .toList();
      case 3:
        return produceList
            .where((produce) => produce.harvestingMonth == 'March')
            .toList();
      case 4:
        return produceList
            .where((produce) => produce.harvestingMonth == 'April')
            .toList();
      case 5:
        return produceList
            .where((produce) => produce.harvestingMonth == 'May')
            .toList();
      case 6:
        return produceList
            .where((produce) => produce.harvestingMonth == 'June')
            .toList();
      case 7:
        return produceList
            .where((produce) => produce.harvestingMonth == 'July')
            .toList();
      case 8:
        return produceList
            .where((produce) => produce.harvestingMonth == 'August')
            .toList();
      case 9:
        return produceList
            .where((produce) => produce.harvestingMonth == 'September')
            .toList();
      case 10:
        return produceList
            .where((produce) => produce.harvestingMonth == 'October')
            .toList();
      case 11:
        return produceList
            .where((produce) => produce.harvestingMonth == 'November')
            .toList();
      case 12:
        return produceList
            .where((produce) => produce.harvestingMonth == 'December')
            .toList();
      default:
        return produceList;
    }
  }

  void selectFilterOption(int index) {
    selectedFilterOptionIndex.value = index;
  }

  void addProduce(Produce produce) {
    produceList.add(produce);
  }

  void removeProduce(Produce produce) {
    produceList.remove(produce);
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

  Produce(
      {required this.name,
      required this.adminName,
      required this.community,
      required this.sowingMonth,
      required this.harvestingMonth,
      required this.harvestingProduceWeight,
      required this.farmerName,
      required this.farmerContact,
      required this.adminContact,
      required this.rating,
      required this.description});
}
