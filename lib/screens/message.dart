import 'package:flutter/material.dart';

class Messages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold( appBar:AppBar(
       centerTitle:true,
       title: Text("Messages"),
     ),
     body:Center(child:Text("Messages"))
   );
  }
}