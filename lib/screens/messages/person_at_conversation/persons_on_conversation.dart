import 'package:flutter/material.dart';
import 'package:listar_flux/models/person.dart';
import 'package:listar_flux/widget/margin.dart';

import 'adding_controll.dart';
import 'person_controll.dart';

class PersonOnConversation extends StatefulWidget {
  final List<Person> images;
  PersonOnConversation({@required this.images});
  @override
  State<StatefulWidget> createState() {
    return _PersonOnConversationState();
  }
}

class _PersonOnConversationState extends State<PersonOnConversation> {
  List<Person> images;
  @override
  void initState() {
    super.initState();
    images = widget.images;
  }

  void addImage(String path, String name) {
    if (path != null) {
      setState(() {
        images.add(Person(imgPath: path, name: name));
      });
    }
  }

  void removing(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Persons details")),
      floatingActionButton: AddingControll(
        addImage: addImage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Margin(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return PersonControll(
                    index: index,
                    removing: removing,
                    person: images[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
