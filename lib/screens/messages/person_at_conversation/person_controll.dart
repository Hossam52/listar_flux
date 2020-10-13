import 'package:flutter/material.dart';
import 'package:listar_flux/models/person.dart';

class PersonControll extends StatelessWidget {
  final Person person;
  final Function removing;
  final index;

  const PersonControll(
      {Key key,
      @required this.person,
      @required this.removing,
      @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(
          person.imgPath,
        ),
      ),
      title: Text(person.name),
      trailing: IconButton(
          icon: Icon(Icons.delete), onPressed: () => removing(index)),
    );
  }
}
