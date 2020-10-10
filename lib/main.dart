import 'package:flutter/material.dart';

import 'entry_screen.dart';
void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      color: Colors.deepOrangeAccent,
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => ListarFlux()},
    );
  }

}

