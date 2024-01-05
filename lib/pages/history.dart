import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // Define variables
  final selectedDate =
      DateTime.now(); // Example value, replace it with your actual date
  final numberOfTickets =
      2; // Example value, replace it with your actual number of tickets

  // Helper method to build ticket info row
  Widget _buildTicketInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a ticket container
  Widget _buildTicketContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 210, 235, 255),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTicketInfoRow("Date", '${selectedDate.toLocal()}'),
              const Divider(),
              _buildTicketInfoRow("PAX", '$numberOfTickets'),
              const Divider(),
              _buildTicketInfoRow("Total", 'Rp 5.000,00'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Column(
                      children: [
                        Text(
                          'Riwayat Pembelian Tiket',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildTicketContainer(),
                SizedBox(height: 20),
                _buildTicketContainer(),
                SizedBox(height: 20),
                _buildTicketContainer(),
                SizedBox(height: 20),
                _buildTicketContainer(), // Add
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: History(),
  ));
}
