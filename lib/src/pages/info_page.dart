import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion' , style: TextStyle( color: Colors.white),)
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}

class Blog extends StatelessWidget {
  const Blog(
    {
      Key key,
      @required this.text,
      @required this.titulo,
      this.image
    }) : super(key: key);

  final String text;
  final String titulo;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );
  }
}