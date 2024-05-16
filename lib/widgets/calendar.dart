import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  Map<DateTime, List<dynamic>> _events = {};
  List<dynamic> _selectedEvents = [];

  void _onDaySelected(DateTime day, List<dynamic> events) {
    setState(() {
      _selectedDate = day;
      _selectedEvents = events;
    });
    // Thực hiện chuyển đến trang khác ở đây
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnotherPage(date: day)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      focusedDay: _selectedDate,
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      eventLoader: (day) {
        return _events[day] ?? [];
      },
      onDaySelected: (selectedDay, focusedDay) {
        _onDaySelected(selectedDay, _events[selectedDay] ?? []);
      },
    );
  }
}

class AnotherPage extends StatelessWidget {
  final DateTime date;

  const AnotherPage({required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Date'),
      ),
      body: Center(
        child: Text('Selected date: ${date.toString().substring(0, 10)}'),
      ),
    );
  }
}
class CalendarFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, 
      height: MediaQuery.of(context).size.height * 0.4,// Chiều rộng của khung lịch
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey), // Đường viền của khung
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Calendar(),
          Positioned(
            bottom: 40,
            child: IconButton(
              iconSize: 100,
              icon: Icon(Icons.calendar_month),
              onPressed: () {
                // Thực hiện hành động khi nhấp vào biểu tượng
              },
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
                  'Calendar', // Văn bản dưới biểu tượng
                  style: TextStyle(
                    fontSize: 20, // Kích thước văn bản
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

