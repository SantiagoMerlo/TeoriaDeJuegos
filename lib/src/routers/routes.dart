import 'package:flutter/material.dart';
import 'package:teoria_de_juegos/src/pages/cal_page.dart';
import 'package:teoria_de_juegos/src/pages/game_page/fosforo_page.dart';
import 'package:teoria_de_juegos/src/pages/game_page/monty_page.dart';
import 'package:teoria_de_juegos/src/pages/game_page/piedra_page.dart';
import 'package:teoria_de_juegos/src/pages/game_page/prision_page.dart';
import 'package:teoria_de_juegos/src/pages/home_page.dart';
import 'package:teoria_de_juegos/src/pages/info_page.dart';

Map<String , WidgetBuilder> getRoutes(){
  return {
    '/' : (BuildContext context) => HomePage(),
    '/info' : (BuildContext context) => InfoPage(),
    '/calcu' : (BuildContext context) => CalcuPage(),
    '/prision' : (BuildContext context) => PrisionPage(),
    '/piedra' : (BuildContext context) => PiedraPage(),
    '/monty' : (BuildContext context) => MontyPage(),
    '/fosforo' : (BuildContext context) => FosforoPage(),
  };
}