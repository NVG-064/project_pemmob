import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  late DateTime selectedDate;
  int numberOfTickets = 1;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    Future.delayed(Duration.zero, () => _selectDate(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ticket',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Museum Fatahillah',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pilih Tanggal:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TableCalendar(
              focusedDay: selectedDate,
              firstDay: DateTime.now(),
              lastDay: DateTime(2101),
              calendarFormat: CalendarFormat.month,
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'PAX :',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    color: Color(0xFFF05941),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (numberOfTickets > 1) {
                          numberOfTickets--;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 90),
                Text(
                  '$numberOfTickets ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 90),
                Ink(
                  decoration: ShapeDecoration(
                    color: Color(0xFFF05941),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        numberOfTickets++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for "Pesan Sekarang" button here
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF05941), // background color
                onPrimary: Colors.white, // text color
              ),
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
