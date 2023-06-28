import 'package:flutter/material.dart';
import '../homepage/app/features/product/views/screens/product_detail_screen.dart';
import 'booking_controller.dart';

class DetailedBookingPage extends StatelessWidget {
  final Produce produce;
  const DetailedBookingPage({Key? key, required this.produce})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff0f4f7),
        elevation: 0,
        leading: CustomBackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    produce.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        produce.harvestingProduceWeight,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(
                        0, 2), // changes the position of the shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16.0),
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sowing Month',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        produce.sowingMonth,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 36, 173, 40),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                    width: 30,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.black54,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Harvesting Month',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        produce.harvestingMonth,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 36, 173, 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 8,
              ),
              child: Text(
                'Community Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(
                        0, 2), // changes the position of the shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Place :    ',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        produce.community,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Admin Name :    ',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        produce.adminName,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact :    ',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        produce.adminContact,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 8,
              ),
              child: Text(
                'Farmer Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              height: 125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(
                        0, 2), // changes the position of the shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Name :    ',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        produce.farmerName,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact :    ',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        produce.farmerContact,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Rating:    ',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Rating(produce.rating),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Description:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 8, left: 16, right: 8),
              child: Text(
                produce.description,
                style: const TextStyle(fontSize: 18.0, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('Interest shown successfully'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  icon: const Icon(
                    Icons.thumb_up,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    'Show Interest',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text(
                              'Your booking is done. Please contact admin for more details.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.green),
                    ),
                  ),
                  icon: const Icon(
                    Icons.book,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
