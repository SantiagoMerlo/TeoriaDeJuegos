import 'package:flutter/material.dart';
import 'package:teoria_de_juegos/src/routers/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teoria de Juegos',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange[900],
          accentColor: Colors.orange[900],
          textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme ),
          primaryTextTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)
          ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: getRoutes(),
    );
  }
}
