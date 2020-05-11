import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:teoria_de_juegos/src/widgets/colors.dart';


class FosforoPage extends StatefulWidget {
  @override
  _FosforoPageState createState() => _FosforoPageState();
}

class _FosforoPageState extends State<FosforoPage> {
  final random = Random();
  double _nPlayers = 2;
  double _nMatch = 9;
  bool _playing = false;
  bool _end = false;
  int _player = 1;
  int _less = 0;
  int _i = 0;
  Color _backTurn = getTriada[4];

  double _height = 100;
  double _width = 100;
  BorderRadius _borderRadius = BorderRadius.circular(20);
  Color _color    = getTriada[3];


  Widget _state;

  @override
  Widget build(BuildContext context) {

    setState(() {
      (_playing)
          ? (_end) 
            ? _state = _endView()
            : _state = _play()
          : _state = _introduction(context);
    });
    
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Dilema del Fosforo'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image(image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,)),
          _state,
        ],
      ),
    );
  }

  Widget _selectPlayers() {
    return Slider(
        activeColor: Colors.orange[800],
        label: _nPlayers.toInt().toString(),
        divisions: 4,
        value: _nPlayers.toDouble(),
        min: 2,
        max: 6,
        onChanged: (_playing)
            ? null
            : (valor) {
                setState(() {
                  _nPlayers = valor;
                });
              });
  }

  Widget _selectMatch() {
    return Slider(
        activeColor: Colors.orange[800],
        label: _nMatch.toInt().toString(),
        divisions: 41,
        value: _nMatch.toDouble(),
        min: 9,
        max: 50,
        onChanged: (_playing)
            ? null
            : (valor) {
                setState(() {
                  _nMatch = valor;
                });
              });
  }

  Widget _texto(String value, double tamanio) {
    return Text(
      value,
      style: TextStyle(fontSize: tamanio, color: Colors.black , fontWeight: FontWeight.w400),
    );
  }

  Widget _fooOptions(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
            heroTag: 'f1', 
            child: Icon(Icons.info), 
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Informacion:'),
                    content: Text('El juego consiste en ir sacando fosforos. El que saque el ultimo pierde!'),
                    elevation: 24.0,
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                );
                },
              );
            }),
        SizedBox(
          width: 50,
        ),
        FloatingActionButton(
            heroTag: 'f2',
            child: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                _playing = true;
              });
            }),
      ],
    ); 
  }

/*
  Menu options, it's before to start the game.
*/
  Widget _introduction( BuildContext context){
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
            height: 350,
            width: 300,
            color: Colors.white,
            child: Column(children: <Widget>[
              Container(
                color: Colors.orange[900],
                width: double.maxFinite,
                child: Column(
                  //portada
                  children: <Widget>[
                    SizedBox(height: 15),
                    Text("Juego de los Fosforos", 
                    style: TextStyle(fontSize: 20, )),
                    SizedBox(height: 20)
                  ],
                ),
              ),
              SizedBox(height: 20),
              _texto('Cantidad de Jugadores: ${_nPlayers.toInt()}', 14),
              _selectPlayers(),
              SizedBox(height: 40),
              _texto('Cantidad de fosforos: ${_nMatch.toInt()}', 14),
              _selectMatch(),
              SizedBox(height: 30),
              _fooOptions(context)
            ])),
      ),
    );
  }
/*
  Then menu option, it's logic of game
*/
  Widget _play(){

    return Center(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: <Widget>[
            Expanded(child:_viewGame()),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
              child: Container(
                color: _backTurn,
                child: Column(
                  children: <Widget>[
                    _turnGame(),
                    SizedBox(height: 15),
                    _optionGame(),
                    SizedBox(height: 30),
                    _validation(),
                    SizedBox(height: 15)
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _viewGame(){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget> [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
          height: _height,
          width: _width,
          decoration: BoxDecoration(
             borderRadius: _borderRadius,
             color: _color
             ),
        ),
         Text('${_nMatch.toInt()}',
           textAlign: TextAlign.center,
           style: TextStyle(
             fontSize: 50,
           ),),
      ]
    );
  }
  
  Widget _turnGame(){
    return Card(
      color: _color,
      elevation: 15,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Center(
              child: Text('Turno del jugador $_player',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                  ),
                  )
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  Widget _optionGame(){
    return Row(children: <Widget>[
      SizedBox(width: 20),
      FloatingActionButton(
        backgroundColor: _color,
        heroTag: 'og1',
        onPressed: (){
          if( _less > 0) _less--;
          setState(() {});
        },
        child: Icon(Icons.exposure_neg_1)
      ),
      Expanded(child: SizedBox()),
      Card(
        elevation: 15,
        color: _color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Container(
          height: 60,
          width: 60,
          child: Center(
            child: Text(_less.toString(),
            style: TextStyle(
              fontSize: 20
            ),
      ),
          ),
        ),
      ), 
      Expanded(child: SizedBox()),
      FloatingActionButton(
        backgroundColor: _color,
        heroTag: 'og2',
        onPressed: ((){
          int aux;
          aux = _nMatch.toInt() - _less;
          if(aux > 1){
            if( _less < 3 ) _less++;
            setState(() {});
          }
        }),
        child: Icon(Icons.exposure_plus_1),
      ),
      SizedBox(width: 20)
    ],);
  }

  Widget _validation(){
    return Center(
      child: FloatingActionButton(
        backgroundColor: _color,
        child: Icon(Icons.play_arrow),
        onPressed: (){

          int resto = _nMatch.toInt() - _less;

          //el juego termina
          if(1 == resto){
            _finish(_nextPlayer());
          }else{
            setState(() {
              _less = 0;
              _i++;
              _player = _nextPlayer();
              _nMatch = resto.toDouble();
              _backTurn = getTriada[_i%6];
              _width = random.nextInt(300).toDouble();
              if(_width < 40) _width = 50;
              _height = random.nextInt(300).toDouble();
              if(_height < 40) _height = 50;
              _color = getTriada[(_i+1)%6];
              _borderRadius = new BorderRadius.circular(random.nextInt(100).toDouble());
            });
          }
        }),
    );
  }

  int _nextPlayer(){

    if(_player == _nPlayers.toInt()){

      _player = 1;

    }else{

      _player++;

    }
    setState(() {});

    return _player;
  }

  void _finish(int player){
    setState(() {
      _player = player;
      _end = true;
    });
  }
  
  Widget _endView(){
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 170,
          width: 300,
          color: Colors.orange[600],
          child:
          Column(children: <Widget>[
            Card(
              color: Colors.orange[800],
              elevation: 20,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              child: Column(

                children: <Widget>[
                  SizedBox(height: 30, width: 300),
                  Text.rich(TextSpan(
                    text: 'El ',
                    children: <TextSpan> [
                      TextSpan( text: 'Jugador $_player ', style: TextStyle( fontWeight: FontWeight.bold )),
                      TextSpan( text: 'ha perdido' , style: TextStyle( color: getColores[0] , fontWeight: FontWeight.bold))
                    ]
                  )),
                  SizedBox(height: 30,)
                ],
              )),
            SizedBox(height: 20,),
            FloatingActionButton(
              elevation: 20,
              onPressed: (){
                setState(() {
                  _playing = false;
                  _end = false;
                  _nPlayers = 2;
                  _nMatch = 9;
                  _player = 1;
                  _height = 100;
                  _width = 100;
                });
              },
              child: Text('OK'),)
          ],)
        ),
      ),
    );
  }

}
