import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class EventsPage extends StatelessWidget {
  final Rx<DateTime> _focusedDay = DateTime.now().obs;
  final Rx<DateTime?> _selectedDate = Rx<DateTime?>(null);
  final Rx<Map<String, List<dynamic>>?> _mySelectedEvents =
      Rx<Map<String, List<dynamic>>?>(null);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descpController = TextEditingController();

  EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event Calendar'),
      ),
      body: Column(
        children: [
          Obx(() => TableCalendar(
                focusedDay: _focusedDay.value,
                firstDay: DateTime(2023),
                lastDay: DateTime(2099),
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) =>
                    _isSameDay(_selectedDate.value, day),
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDate.value, selectedDay)) {
                    _selectedDate.value = selectedDay;
                  }
                  _focusedDay.value = focusedDay;
                },
                onPageChanged: (focusedDay) {
                  _focusedDay.value = focusedDay;
                },
                eventLoader: (day) => _listOfDayEvents(day),
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.green.withOpacity(
                        .7), // Use a fade color for the current day
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: const TextStyle(color: Colors.black),
                  holidayDecoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              )),
          Expanded(
            child: Obx(() {
              final selectedEvents = _listOfDayEvents(_selectedDate.value);
              return ListView.builder(
                itemCount: selectedEvents.length,
                itemBuilder: (context, index) {
                  final event = selectedEvents[index];
                  return ListTile(
                    leading: const Icon(
                      Icons.done,
                      color: Colors.teal,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('Event Title: ${event['eventTitle']}'),
                    ),
                    subtitle: Text('Description: ${event['eventDescp']}'),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddEventDialog,
        label: const Text('Add Event'),
      ),
    );
  }

  List<dynamic> _listOfDayEvents(DateTime? dateTime) {
    if (_mySelectedEvents.value != null && dateTime != null) {
      return _mySelectedEvents.value![dateTime] ?? [];
    }
    return [];
  }

  bool _isSameDay(DateTime? dateA, DateTime? dateB) {
    if (dateA == null || dateB == null) return false;
    return dateA.year == dateB.year &&
        dateA.month == dateB.month &&
        dateA.day == dateB.day;
  }

  void _showAddEventDialog() {
    Get.defaultDialog(
      title: 'Add New Event',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: descpController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _addEvent();
            Get.back();
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  void _addEvent() {
    final eventTitle = titleController.text;
    final eventDescp = descpController.text;
    final selectedDate = _selectedDate.value;

    if (eventTitle.isNotEmpty &&
        eventDescp.isNotEmpty &&
        selectedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      final event = {
        'eventTitle': eventTitle,
        'eventDescp': eventDescp,
      };

      if (_mySelectedEvents.value == null) {
        _mySelectedEvents.value = {
          formattedDate: [event]
        };
      } else {
        if (_mySelectedEvents.value!.containsKey(formattedDate)) {
          _mySelectedEvents.value![formattedDate]!.add(event);
        } else {
          _mySelectedEvents.value![formattedDate] = [event];
        }
      }

      // Refresh the calendar view
      _focusedDay.refresh();

      titleController.clear();
      descpController.clear();
    }
  }
}
