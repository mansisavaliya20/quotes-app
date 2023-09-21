import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qutoes_app/views/screens/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
    theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(bodyText2: GoogleFonts.aBeeZee())),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Home_page();
  }
}
