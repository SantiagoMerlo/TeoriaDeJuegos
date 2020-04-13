import 'package:flutter/material.dart';
import 'package:teoria_de_juegos/src/routers/routes.dart';

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
          fontFamily: 'Raleway'),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: getRoutes(),
    );
  }
}
