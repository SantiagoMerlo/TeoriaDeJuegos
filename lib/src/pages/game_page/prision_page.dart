import 'dart:math';

import 'package:flutter/material.dart';

class PrisionPage extends StatefulWidget {

  @override
  _PrisionPageState createState() => _PrisionPageState();
}

class _PrisionPageState extends State<PrisionPage> {

  Widget _state;
  int _mood = 4;



  @override
  Widget build(BuildContext context) {


    setState(() {
    if (_mood == 4)          _state = _introduccion();
    else if ( _mood == 5 )   _state = _playing();
    else if ( _mood == 0 )   _state = _final(0);
    else if ( _mood == 1 )   _state = _final(1);
    else if ( _mood == 2 )   _state = _final(2);
    else _state = _final(3);
    });
    
    return Scaffold(
       appBar: AppBar(
         title: Text('Dilema del Prisionero')
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

/*
  Explicacion de que va el juego, introduccion
*/
  Widget _introduccion(){

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          _card('Acto 1',
            'La planificacion',
            'Durante mucho tiempo estuvimos planificando como desarrollariamos el plan. Ambos sabemos cada centimetro de esta maravilloza estrategia.',
            Image.asset('assets/Prision/robo.jpg', fit: BoxFit.fill,)),
          SizedBox(height: 20),
          _card('Acto 2',
            'La incursion',
            'Entrar al banco no iba a ser realmente un problema, no le tememos a la policia ya que no escaparemos por la puerta principal.',
            Image.asset('assets/Prision/robo.jpg', fit: BoxFit.fill,)),
          SizedBox(height: 20),
          _card('Acto 3',
            'El robo',
            'Tal vez es lo mas cliche que hay. Sin embargo, justo vivo al lado asi que no iba a ser tan dificil cabar un poco y escaparnos por la verdadera ruta de escape que hicimos en mi casa.',
            Image.asset('assets/Prision/robo.jpg', fit: BoxFit.fill,)),
          SizedBox(height: 20),
          _card('Acto 4',
            'El escape',
            'Despistar a la policia iba a ser el mayor de los problemas, pero con un plan simple de hacerlos creer que seguiamos adentro era la mejor solucion.',
            Image.asset('assets/Prision/robo.jpg', fit: BoxFit.fill)),
          SizedBox(height: 20),
          _card('Acto 5',
            'La desgracia',
            'No todo salio exactamente como queriamos. Todo iba perfectamente a lo planeado, pero tuvimos un gran error. El auto que robamos hace unas pocas horas atras para escaparnos tenia GPS, por lo que la policia no tardo mucho en atraparnos.',
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 200,
                width: 100,
                child: Image.asset('assets/Prision/g5299.png'),
              ),
              Container(
                height: 200,
                width: 100,
                child: Image.asset('assets/Prision/g8714.png'),
              ),
              Container(
                height: 200,
                width: 100,
                child: Image.asset('assets/Prision/g5299.png'),
              ),
            ],
          )
          ),
          SizedBox(height: 20),
          _card('Acto 6',
            'La intervension',
            'Tal vez me dieron una esperanza o una condena aun mayor. El punto es que ahora tendre que decidir que hacer.',
            Image.asset('assets/Prision/g13676.png', fit: BoxFit.fill)),
          SizedBox(height: 20),
          FloatingActionButton(
            child: Icon(Icons.play_arrow , size: 50), 
            onPressed: (){
              setState(() {
                _mood = 5;
              });
            })
        ],
      ),
    );
  }

  Widget _card(String titulo , String subtitulo, String text ,Widget container){
    final card = Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Text(titulo , style: TextStyle(fontSize: 16 )),
          SizedBox(height: 5),
          Text(subtitulo , style: TextStyle( color: Colors.grey[400])),
          SizedBox(height: 15),
          container,
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 10.0),
            child: Text(text)
          )
        ],)
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[700],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 10.0)
          )
        ]
        ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card
      )
      );
  
  }

  Widget _playing(){

    return ListView(
      children: <Widget>[
        SizedBox(height: 20),
        _card("Indagatoria", 
        "Ahora tendre que elegir que hacer", 
        "Las opciones que me plantearon fueron simplemente dos, cooperar o no. \n\n - En el caso de que coopere y mi comapañero no, tendre cinco año de carcel y el quince. \n-Si los dos no cooperamos tendremos solo tres años de carcel. \n- Si yo no coopero y el si, tendre quince años de carcel y el cinco.\n-Finalmente, si los dos cooperamos tendremos 10 años de carcel", 
        Image.asset('assets/Prision/g13676.png', fit: BoxFit.fill)),  
        SizedBox(height: 30),
        _case(0,'Cooperar'),
        SizedBox(height: 15),
        _case(1, 'No Cooperar'),
        SizedBox(height: 30)
      ],
    );
  }

  Widget _case(int opcion , String text){

    final random = Random();
    int choiceIA = random.nextInt(1);


    return GestureDetector(
      onTap: (){
        setState(() {
          if(opcion == 0 && choiceIA == 0) _mood = 0;
          else if (opcion == 0 && choiceIA == 1) _mood = 1;
          else if (opcion == 1 && choiceIA == 0) _mood = 2;
          else _mood = 3;
        });
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Colors.orange[900],
            height: 50,
            width: 250,
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }

  Widget _final(int n){
    Widget response;
    
    if( n == 0){
      response = _card(
            "Resultado!", 
            'Cooperaste', 
            "Desgraciadamente tu compañero tambien coopero, por lo que tendran que pasar unos diez años juntos. \n\nTeniendo en cuenta la teoria del juego, esta era la mejor opcion para tomar. Indepednientemente si tu compañero cooperaba o no, vos no ibas a tener la condena mas mala.", 
            Image.asset('assets/Prision/g13512.png', fit: BoxFit.cover));

    } else if( n == 1 ){
      response = _card(
              "Resultado!", 
              "Cooperaste", 
              "Afortunadamente tu compañero no dijo ni una sola palabra, asi que el tendre la mayor condena y en poco tiempo ya seras libre. \nTeniendo en cuenta la teoria del juego, esta era la mejor opcion para tomar. Indepednientemente si tu compañero cooperaba o no, vos ibas a tener la condena menos mala.", 
              Image.asset('assets/Prision/g13151.png', fit: BoxFit.cover));
    } else if ( n == 2 ){
      response =  _card(
              "Resultado!", 
              "No Cooperaste", 
              "Desgraciadamente tu compañero si coopero, asi que tu tendras la mayor condena y en poco tiempo el sera libre. \nTeniendo en cuenta la teoria de juegos, esta es la pero opcion. Ya que estas haciendo tu estrategia en base al pensamiento del otro y opta por un plan el cual si sale mal, como en este caso, tienes la mayor cantidad de perdida.", 
              Image.asset('assets/Prision/g13395.png', fit: BoxFit.cover));
    } else {
      response = _card(
              "Resultado!", 
              "No Cooperaste", 
              "Afortunadamente tu compañero tampoco coopera, asi que sera cuestion de tiempo para que ambos sean libres. \nTeniendo en cuenta la teoria de juegos, esta es la pero opcion. Ya que estas haciendo tu estrategia en base al pensamiento del otro y opta por un plan el cual si sale mal tienes la mayor cantidad de perdida. Sin embargo este no fue el caso, hiciste bien en confiar en tu amigo.", 
              Image.asset('assets/Prision/g13512.png', fit: BoxFit.cover));
    }
    
    return ListView(children: <Widget>[
      SizedBox(height: 25),
      response,
      SizedBox(height: 25),
      FloatingActionButton(
            child: Icon(Icons.home , size: 40), 
            onPressed: (){
                Navigator.pushNamed(context, '/');
              }
            )
    ]);
  }
}