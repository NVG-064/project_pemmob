import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final DateTime selectedDate;
  final int numberOfTickets;

  // Constructor to receive selectedDate and numberOfTickets from the previous page
  const PaymentPage({
    Key? key,
    required this.selectedDate,
    required this.numberOfTickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        // Wrap with Center widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Date: ${selectedDate.toLocal()}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'PAX : $numberOfTickets',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Destination : Museum Fatahillah',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Choose Payment Method:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // Add your payment method options here (e.g., credit card, PayPal, etc.)
              ElevatedButton(
                onPressed: () {
                  // Implement payment processing logic
                  _handlePayment(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF05941), // background color
                  onPrimary: Colors.white, // text color
                ),
                child: Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePayment(BuildContext context) {
    // Implement your payment processing logic here
    // For example, you can navigate to a confirmation page after successful payment
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

  // Constructor to receive selectedDate and numberOfTickets from the payment page
  const ConfirmationPage({
    Key? key,
    required this.selectedDate,
    required this.numberOfTickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Center(
        // Wrap with Center widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Thank you for your purchase!',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Date: ${selectedDate.toLocal()}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'PAX : $numberOfTickets',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // You can add more information or actions for the user
              Text(
                'Destination : Museum Fatahillah',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // You can add more information or actions for the user
            ],
          ),
        ),
      ),
    );
  }
}
