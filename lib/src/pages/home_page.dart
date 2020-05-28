import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:teoria_de_juegos/src/providers/game_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> _lista = getGames();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game Theory',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image(image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,)),
          Column(children: <Widget>[
            _getTarjetas(),
          ]),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _foo(context),
    );
  }

  Widget _getTarjetas() {

    final _screemSize = MediaQuery.of(context).size;

    final swiper = Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, _lista[index]['router']),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: <Widget>[
                    FadeInImage(
                      placeholder: AssetImage('assets/loading.gif'),
                      image: NetworkImage(_lista[index]['url']),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _texto(_lista[index]['game_name'], 28),
                    SizedBox(
                      height: 15,
                    ),
                    _texto(_lista[index]['description'], 15)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _lista.length,
        itemWidth: _screemSize.width * 0.8,
        itemHeight: _screemSize.height * 0.65,
        layout: SwiperLayout.STACK,
      );

    return Container(
      padding: EdgeInsets.only(top: 25, left: 15),
      width: double.infinity,
      child: swiper
    );
  }

  Widget _texto(String texto, double tamanio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        texto,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.white, fontSize: tamanio),
      ),
    );
  }

  Widget _foo(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 15,
        ),
        FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () => Navigator.pushNamed(context, '/info'),
            child: Icon(Icons.info_outline)),
        Expanded(child: SizedBox()),
        FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => Navigator.pushNamed(context, '/calcu'),
            child: Icon(Icons.casino)),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
