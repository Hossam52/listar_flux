import 'package:flutter/material.dart';

class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(
       centerTitle:true,
       title: Text("Account"),
     ),
     body:Center(child:Text("Account"))
   );
  }
}