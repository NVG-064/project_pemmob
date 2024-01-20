import 'package:flutter/material.dart';

class PaymentAdmin extends StatelessWidget {
  final DateTime selectedDate;
  final int numberOfTickets;

  const PaymentAdmin({
    Key? key,
    required this.selectedDate,
    required this.numberOfTickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView for scrollability
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedDate.toLocal()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  color: Color.fromARGB(255, 210, 235, 255),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      _buildTicketInfoRow("Date", '${selectedDate.toLocal()}'),
                      _buildTicketInfoRow(
                          "Anggara Kahirudin", '$numberOfTickets'),
                      _buildTicketInfoRow("Total", 'Rp 5.000,00'),
                      _buildTicketInfoRow("Destination", 'Museum Fatahillah'),
                      const SizedBox(height: 20),
                      _buildTicketInfoRow(
                          "Metode Pembayaran", 'Dompet digital - Dana'),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTicketInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const Divider(thickness: 1.5),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String title, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        color: Color.fromARGB(255, 210, 235, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 1.5,
              ),
              Column(
                children: options.map((option) {
                  return _buildMultipleChoice(option);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMultipleChoice(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: null,
                groupValue: null,
                onChanged: null,
              ),
              Text(
                option,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handlePayment(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(
          selectedDate: selectedDate,
          numberOfTickets: numberOfTickets,
        ),
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  final DateTime selectedDate;
  final int numberOfTickets;

  const ConfirmationPage({
    Key? key,
    required this.selectedDate,
    required this.numberOfTickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildTicketInfoRow("Booking ID", '000102340908'),
                    _buildTicketInfoRow("Date", '${selectedDate.toLocal()}'),
                    _buildTicketInfoRow("PAX", '$numberOfTickets'),
                    _buildTicketInfoRow("Total", 'Rp 5.000,00'),
                    _buildTicketInfoRow(
                      "Destination",
                      'Museum Fatahillah',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketInfoRow(String label, String value,
      {double fontSize = 16}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300),
              ),
              Text(
                value,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const Divider(thickness: 1.5),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentAdmin(
      selectedDate: DateTime.now(),
      numberOfTickets: 2,
    ),
  ));
}
