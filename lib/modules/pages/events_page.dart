import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.now().subtract(const Duration(days: 365)),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              calendarStyle: const CalendarStyle(
                weekendTextStyle: TextStyle(color: Colors.red),
                holidayTextStyle: TextStyle(color: Colors.green),
              ),
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, _) => Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                todayBuilder: (context, date, _) => Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                _handleNewDate(selectedDay);
              },
            ),
            _buildEventList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _addEvent(context),
        ),
      ),
    );
  }

  void _handleNewDate(DateTime date) {
    print('Selected date: $date');
  }

  Widget _buildEventList() {
    final List<CleanCalendarEvent> selectedEvents = [
      CleanCalendarEvent(
        summary: 'Event 1',
        description: 'Event 1 description',
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 1)),
        color: Colors.blue,
      ),
      CleanCalendarEvent(
        summary: 'Event 2',
        description: 'Event 2 description',
        startTime: DateTime.now().add(const Duration(days: 1)),
        endTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
        color: Colors.red,
      ),
    ];

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          final CleanCalendarEvent event = selectedEvents[index];
          final String start =
              DateFormat('HH:mm').format(event.startTime).toString();
          final String end =
              DateFormat('HH:mm').format(event.endTime).toString();
          return ListTile(
            contentPadding: const EdgeInsets.only(
                left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
            leading: Container(
              width: 10.0,
              color: event.color,
            ),
            title: Text(event.summary),
            subtitle:
                event.description.isNotEmpty ? Text(event.description) : null,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(start), Text(end)],
            ),
            onTap: () {},
          );
        },
        itemCount: selectedEvents.length,
      ),
    );
  }
}

_addEvent(BuildContext context) {}

class CleanCalendarEvent {
  final String summary;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final Color color;

  CleanCalendarEvent({
    required this.summary,
    this.description = '',
    required this.startTime,
    required this.endTime,
    required this.color,
  });
}
