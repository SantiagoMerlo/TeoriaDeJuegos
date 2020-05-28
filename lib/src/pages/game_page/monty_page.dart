import 'package:flutter/material.dart';

class MontyPage extends StatefulWidget {
  @override
  _MontyPageState createState() => _MontyPageState();
}

class _MontyPageState extends State<MontyPage> {
  Widget _state;
  int _action = 0;
  String _dirImage = 'assets/Game/';
  int _iPart1 = 0;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (_action == 0)
        _state = _part1();
      else if (_action == 1)
        _state = _part2();
      else if (_action == 2)
        _state = _part3();
      else if (_action == 3)
        _state = _part4();
      else
        _state = _part5();
    });

    return Scaffold(
      appBar: AppBar(title: Text('Monty Hall' ,style: TextStyle(color: Colors.white),)),
      body: Stack(children: <Widget>[
        Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.cover,
            )),
        ListView(
          children: <Widget>[
            _state,
          ],
        )
      ]),
    );
  }

//introduccion - presentacion
  Widget _part1() {
    String image = _dirImage + 'presenter.png';

    String texto;

    if(_iPart1 == 0) texto = '\n\n\tBienvenidos queridos televidentes';
    if(_iPart1 == 1) texto = '\tSoy su presentador, Monty Hall, y en el dia de hoy tendremos un nuevo participante de este increbile show!';
    if(_iPart1 == 2) texto = '\tLas reglas son muy simples!';
    if(_iPart1 == 3) texto = '\tVas a tener que elegir una de tres puertas';
    if(_iPart1 == 4) texto = '\tSi la puerta es la correcta, te ganaras una moto!\n\nCaso contrario una cabra';
    if(_iPart1 == 5) texto = '\tMucha suerte!';

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
                      _cuadroTexto(
                          texto),
                      SizedBox(height: 30)
                    ],
                  )),
              Container(
                  height: 150,
                  width: 200,
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _botton()
        ],
      ),
    );
  }

  Widget _botton() {
    return FloatingActionButton.extended(
      onPressed: () {
        setState(() {
          _iPart1++;
          if(_iPart1 > 5) _action++;
        });
      }, label: Text("   Continuar   ", style: TextStyle(color: Colors.white),)
      );
  }

  Widget _cuadroTexto(String texto) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 250,
        color: Color.fromARGB(180, 135, 65, 0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30 , horizontal: 15),
          child: Column(
            children: <Widget>[
              Text(
                texto,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color:Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Text('...', 
                style: TextStyle( color: Colors.white)
                )
              )
            ],
          ),
        ),
      ),
    );
  }

// elegir primera opcion
  Widget _part2() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 150,
              child: Image(
                image: AssetImage('assets/Game/3doorGroup.png'),
                fit: BoxFit.cover,
              )
            ),
            Container(
              padding: EdgeInsets.only(top:100,left: 200),
              width: 350,
              height: 300,
              child: Image(
                  image: AssetImage('assets/Game/presenterTable.png'),
                  fit: BoxFit.cover,
               ),
            ),
            Container(
              margin: EdgeInsets.only(top:225, left: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Color.fromARGB(180, 135, 65, 0),
                    child: Column(
                        children: <Widget>[
                          SizedBox(height: 15),
                          Text(
                            'Elige una puerta!',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                    ),
                  ),
                ),
              )
          ],
        ),
        SizedBox(height: 50),
        _bottonOpcion(1, 50 , 300),
        SizedBox(height: 15),
        _bottonOpcion(2 , 50 , 300),
        SizedBox(height:15),
        _bottonOpcion(3 , 50 , 300),
        SizedBox(height: 15)
      ],
    );
  }
  Widget _bottonOpcion(int opc, double height, double width){
    return GestureDetector(
      onTap: () {
        setState(() {
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height,
          width: width,
          color: Theme.of(context).primaryColor,
          child: Center(
            child:
                Text('Puerta ' + opc.toString(),
                style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }

// texto de apertura
  Widget _part3() {
    return Container();
  }

// eleccion nuevamente
  Widget _part4() {
    return Container();
  }

// resultado
  Widget _part5() {
    return Container();
  }
}
