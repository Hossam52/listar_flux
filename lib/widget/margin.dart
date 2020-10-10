import 'package:flutter/material.dart';

class Margin extends StatelessWidget{
  final Widget child;
  final EdgeInsetsGeometry margin;

  const Margin({Key key, this.margin=const EdgeInsets.all(10), this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:child,
      margin: margin,
    );
  }
}