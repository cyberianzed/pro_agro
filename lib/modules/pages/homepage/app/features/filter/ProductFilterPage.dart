import 'package:flutter/material.dart';

class ProductFilterPage extends StatefulWidget {
  @override
  _ProductFilterPageState createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  double _minPrice = 0.0;
  double _maxPrice = 1000.0;
  DateTime? _expiryDate;

  void _applyFilters() {
    // Apply filters based on _minPrice, _maxPrice, and _expiryDate
    // You can perform any desired filtering logic here
    print('Applied Filters:');
    print('Min Price: $_minPrice');
    print('Max Price: $_maxPrice');
    print('Expiry Date: $_expiryDate');
  }

  void _resetFilters() {
    setState(() {
      _minPrice = 0.0;
      _maxPrice = 1000.0;
      _expiryDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Filter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Min Price:'),
            Slider(
              min: 0.0,
              max: 1000.0,
              divisions: 100,
              value: _minPrice,
              onChanged: (value) {
                setState(() {
                  _minPrice = value;
                  if (_maxPrice < _minPrice) {
                    _maxPrice = _minPrice;
                  }
                });
              },
            ),
            Text(
                '₹${_minPrice.toStringAsFixed(2)}'), // Updated currency symbol to ₹
            SizedBox(height: 16.0),
            Text('Max Price:'),
            Slider(
              min: _minPrice,
              max: 1000.0,
              divisions: 100,
              value: _maxPrice,
              onChanged: (value) {
                setState(() {
                  _maxPrice = value;
                });
              },
            ),
            Text(
                '₹${_maxPrice.toStringAsFixed(2)}'), // Updated currency symbol to ₹
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Expiry Date:'),
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    child: Text(
                      _expiryDate == null
                          ? 'Select Date'
                          : '${_expiryDate!.day}/${_expiryDate!.month}/${_expiryDate!.year}',
                    ),
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (selectedDate != null) {
                        setState(() {
                          _expiryDate = selectedDate;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Apply Filters'),
              onPressed: _applyFilters,
            ),
            ElevatedButton(
              child: Text('Reset Filters'),
              onPressed: _resetFilters,
            ),
          ],
        ),
      ),
    );
  }
}
