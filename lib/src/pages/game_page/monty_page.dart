import 'package:flutter/material.dart';

class MontyPage extends StatefulWidget {
  @override
  _MontyPageState createState() => _MontyPageState();
}

class _MontyPageState extends State<MontyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Monty Hall')
       ),
    );
  }
}