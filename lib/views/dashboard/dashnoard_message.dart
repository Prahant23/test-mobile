import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: DashboardMessage(),
    ),
  );
}

class DashboardMessage extends StatelessWidget {
  final List<String> customers =
      List.generate(100, (index) => 'Customer ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: null,
        title: Text(
          "Messages",
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.headline6,
            fontSize: 24,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              customers[index],
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CustomerMessages(customer: customers[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomerMessages extends StatelessWidget {
  final String customer;
  final List<String> messages;

  CustomerMessages({required this.customer})
      : messages =
            List.generate(100, (index) => 'Message ${index + 1} for $customer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          customer,
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.headline6,
            fontSize: 24,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Text(
                messages[index],
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
