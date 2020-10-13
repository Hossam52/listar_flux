import 'dart:io';

import 'package:flutter/material.dart';
import 'package:listar_flux/widget/margin.dart';

class FullScreenImage extends StatelessWidget {
  final String imgPath;
  FullScreenImage({@required this.imgPath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Image show"),
      centerTitle:true,),
      body: Container(
        color:Colors.grey,
        child: Margin(
          margin:EdgeInsets.all(20),
                child: Center(
            child: Image.file(
              File(imgPath),
            ),
          ),
        ),
      ),
    );
  }
}
