import 'package:flutter/material.dart';

class Notifications extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold( appBar:AppBar(
       centerTitle:true,
       title: Text("Notifications"),
     ),
     body:Center(child:Text("Notifications"))
   );
  }
}