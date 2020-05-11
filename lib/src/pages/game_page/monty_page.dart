import 'package:flutter/material.dart';

class MontyPage extends StatefulWidget {
  @override
  _MontyPageState createState() => _MontyPageState();
}

class _MontyPageState extends State<MontyPage> {

  Widget _state;
  int _action = 0;
  String _dirImage = 'assets/Game/';




  @override
  Widget build(BuildContext context) {


    setState((){
      if(_action == 0) _state = _part1();
      else if(_action == 1) _state = _part2();
      else if(_action == 2) _state = _part3();
      else if(_action == 3) _state = _part4();
      else _state = _part5();
    });




    return Scaffold(
       appBar: AppBar(
         title: Text('Monty Hall')
       ),
       body: ListView(
         children: <Widget>[
           Stack(
             children: <Widget>[
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image(image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,)),
               _state,
             ],
           )
           ]),
    );
  }

//introduccion - presentacion
  Widget _part1(){
    String image = _dirImage + 'presenter.png';

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Container(
                height: 325,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    _cuadroTexto(),
                    SizedBox(height: 30)
                  ],
                )),
              Container(
                height: 150,
                width: 200,
                child: Image(image: AssetImage(image), fit: BoxFit.contain,)),
            ],
          ),          
          SizedBox(height: 20,),
          _botton()
        ],
      ),
    );
  }

  Widget _botton(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 50,
        width: 200,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text('Continuar', style: Theme.of(context).textTheme.subhead),
        ),
      ),
    );
  }
  Widget _cuadroTexto(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 250,
        color: Theme.of(context).secondaryHeaderColor,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text('Hola queridos televidentes. \nSoy su presentador, Monty Hall, y en el dia de hoy tendremos un nuevo participante de este increbile show!\n\n...',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }

// elegir primera opcion
  Widget _part2(){
    return Container(
      child: Text('2')
    );
  }

// texto de apertura
  Widget _part3(){
    return Container();
  }

// eleccion nuevamente
  Widget _part4(){
    return Container();
  }

// resultado
  Widget _part5(){
    return Container();
  }

}