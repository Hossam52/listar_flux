import 'package:flutter/material.dart';

import 'home.dart';

class WhiteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Home().CaffesAndRooms(),
        )
      ],
    );
  }
}
