import 'package:flutter/material.dart';
import 'package:project_pemmob/pages/payment_page.dart';
import 'package:table_calendar/table_calendar.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  DateTime selectedDate = DateTime.now();
  int numberOfTickets = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              selectedDayPredicate: (day) => isSameDay(day, selectedDate),
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'QTY:',
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
                _handlePesanSekarang();
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

  void _handlePesanSekarang() {
    if (selectedDate != null && numberOfTickets > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            selectedDate: selectedDate,
            numberOfTickets: numberOfTickets,
          ),
        ),
      );
    } else {
      print('Please select both date and number of tickets.');
    }
  }
}
