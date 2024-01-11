import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardMessage extends StatelessWidget {
  const DashboardMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: null,
          title: Text("Message",
              style: GoogleFonts.exo(
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onBackground))),
      body: Column(children: [Text("profile page")]),
    );
  }
}
