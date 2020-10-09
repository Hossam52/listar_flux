import 'package:flutter/material.dart';

class WhiteList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold( appBar:AppBar(
       centerTitle:true,
       title: Text("Whitelist"),
     ),
     body:Center(child:Text("WhiteList"))
   );
  }
}