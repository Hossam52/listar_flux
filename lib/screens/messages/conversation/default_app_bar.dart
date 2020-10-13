import 'package:flutter/material.dart';
import 'package:listar_flux/models/person.dart';
import 'package:listar_flux/widget/margin.dart';
import 'package:listar_flux/widget/multi_image.dart';
class DefaultAppBar extends AppBar{
  DefaultAppBar({@required List<Person> personsOnConversation,@required String name}):super(
    leadingWidth: 30,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MultiImage(imagePaths: personsOnConversation, size: 50),
          Margin(child: Text(name))
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.call), onPressed: () {}),
        IconButton(icon: Icon(Icons.videocam_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
  );
}