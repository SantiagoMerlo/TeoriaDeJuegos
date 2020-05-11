import 'dart:math';
import 'package:flutter/material.dart';
import 'package:teoria_de_juegos/src/widgets/colors.dart';

/*
  Si aprendo crear animaciones, en la funcion _view() se podria hacer para dar un poco de suspenso 
  antes que se muestre el resultado
*/

class PiedraPage extends StatefulWidget {

  @override
  _PiedraPageState createState() => _PiedraPageState();
}

class _PiedraPageState extends State<PiedraPage> {

  Map<int,String> map = {
    0:'assets/PPT/g13777.png',
    1:'assets/PPT/g13712.png',
    2:'assets/PPT/g13697.png'
  };
  final random = Random();

  Widget _state;

  bool _playing = true;
  
  int _i = 0;
  int _scorePlayer = 0;
  int _scoreIA = 0;
  int _play;
  Color _color = getTriada[4];
  Color _backColor = getTriada[5];


  @override
  Widget build(BuildContext context) {

    setState(() {
      if(_playing){
        _state = _options();
      }else{
        _state = _view();
      }
    });


    return Scaffold(
        appBar: AppBar(
         title: Text('Piedra, Papel y Tijera')
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
        ) ,
        floatingActionButton: FloatingActionButton(
          heroTag: 'h0',
          child: Icon(Icons.info),
          onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Informacion:'),
                    content: Text('Elige tu opcion y ganale a la IA!'),
                    elevation: 24.0,
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                );
                },
              );
            }
          ),
    );
  }

  Widget _options(){
    return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: <Widget>[
              _score(context),
              SizedBox(height: 30),
              _item(map[0], 0 ,100 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _item(map[1], 1 , 100 ),
                  _item(map[2], 2 , 100 )
                ],
              )
           ],
          ),
        );
  }

  Widget _score(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top:30 ,left: 20 , right: 20),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              color: _backColor,
              height: 140,
              width: double.maxFinite,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    color: _color,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5),
                        Center(
                          child: Text('Score:' , 
                            style: Theme.of(context).textTheme.headline)
                            ),
                        SizedBox(height: 5)
                      ],
                    )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _cardScore(_scorePlayer, 'Player' , context),
                      Text('Vs.', style: Theme.of(context).textTheme.subtitle),
                      _cardScore(_scoreIA , 'IA' , context)
                    ],
                  )
              ],
            )
          ),
        )
      ),
    );
  }

  Widget _cardScore(int n ,String player , BuildContext context){
    return Column(
      children: <Widget>[  
        Card(
          elevation: 15,
          color: _color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Container(
            height: 60,
            width: 60,
            child: Center(
              child: Text(n.toString(),
                style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
        ),
      ),
      Container(
        child: Text(player , style: Theme.of(context).textTheme.subtitle),
        ), 
      ]
    );
  }

  Widget _item( String address , int select , double size){

    return GestureDetector(
        //behavior: HitTestBehavior.translucent,
        onTap: (){
          // 0 piedra, 1 papel , 2 tijeras
          setState(() {
            _play = select;
          });

          _playing = false;
        },
        child: _itemOnly(address, size),
    );
  }

  Widget _itemOnly(String address, double size){

    final image = Image.asset(address);

    return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          elevation: 15,
          color: _color,
          child: Container(
            height: size+10,
            width: size,
            child: image)
          );
  }

  Widget _view(){
    int numIA = random.nextInt(3);
    String r;
    Color cr;
    int pT = _scorePlayer;
    int iT = _scoreIA;

    if(numIA==_play){
      //empate
      r = 'Has Empatado';
      cr = Colors.orange[800];

    }
    else if(numIA<_play){
      if(numIA==0 && _play==2){
        //perdiste
        r = 'Has Perdido';
        cr = Colors.red[800];
        iT++;
      }else{
        //ganaste
        r = 'Has Ganado';
        cr = Colors.blue[800];
        pT++;
      }
    }else{
      if(numIA==2 && _play==0){
        //ganaste
        r = 'Has Ganado';
        cr = Colors.blue[800];
        pT++;
      }else{
        //perdiste
        r = 'Has Perdido';
        cr = Colors.red[800];
        iT++;
      }
    }


    return InkWell(
      onTap: () {
        setState(() {
        _i++;
        _color = getTriada[_i%5];
        _backColor = getTriada[(_i+1)%5];
        _scorePlayer = pT;
        _scoreIA = iT;
        _playing = true;
        });
      },
      child: Container(
        child: Column(
          children: <Widget>[
            _itemOnly(map[numIA], 200),
            SizedBox(height: 30),
            _itemOnly(map[_play] , 200),
            SizedBox(height: 15),
            Container(
              width: double.maxFinite,
              height: 50,
              color: cr,
              child: Center(
                child: Text(r , 
                  style: TextStyle(
                    fontSize: 20
                  )),
              ),
              )
          ],
        ),

      ),
    );
  }
}