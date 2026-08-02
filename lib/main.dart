import 'package:flutter/material.dart';
import 'package:kaagapay/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Kaagapay());
}

class Kaagapay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaagapay',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
