import 'package:flutter/material.dart';
import 'package:listar_flux/models/person.dart';
import 'package:listar_flux/models/pick_image.dart';
import 'package:listar_flux/widget/margin.dart';

class PersonOnConversation extends StatefulWidget {
  final List<Person> images;
  PersonOnConversation({@required this.images});
  @override
  State<StatefulWidget> createState() {
    return _PersonOnConversationState();
  }
}

class _PersonOnConversationState extends State<PersonOnConversation> {
  PickImage pickImage;
  List<Person> images;
  @override
  void initState() {
    super.initState();
    images = widget.images;
    pickImage = PickImage();
  }

  void addImage(String path,String name) {
    if (path != null) {
      setState(() {
        images.add(Person(imgPath: path, name: name));
      });
    }
  }

  void showBottomSheetForName(context, String path) {
    TextEditingController controller = TextEditingController();
    if (path != null)
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Margin(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: "Enter Name",
                    ),
                  ),
                  Margin(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                        width: double.infinity,
                        child:
                            RaisedButton(child: Text("Add"), onPressed: () {addImage(path,controller.text);Navigator.pop(context);})),
                  )
                ],
              ),
            ),
          );
        },
      );
  }

  void showBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Margin(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              leading: Icon(Icons.image, color: Theme.of(context).primaryColor),
              title: Text("Select from gallery"),
              onTap: () async {
                Navigator.pop(context);
                pickImage.imageFromGallery().then(
                    (value) => /*addImage(value, "Ahmed")*/showBottomSheetForName(parentContext,value));
              },
            ),
            ListTile(
                leading:
                    Icon(Icons.camera, color: Theme.of(context).primaryColor),
                title: Text("Take a photo"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage.imageFromCamera().then(
                      (value) =>  /*addImage(value, "Ahmed")*/showBottomSheetForName(parentContext,value));
                }),
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Persons details")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //showBottomSheetForName(context, "");
          showBottomSheet(context);
          // setState(() {
          //   images.add(
          //       Person(imgPath: "assets/images/noImage.png", name: "Ahmed"));
          // });
        },
        tooltip: "Add Person",
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
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        images[index].imgPath,
                      ),
                    ),
                    title: Text(images[index].name),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            images.removeAt(index);
                          });
                        }),
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
