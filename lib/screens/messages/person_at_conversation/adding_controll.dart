import 'package:flutter/material.dart';
import 'package:listar_flux/models/pick_image.dart';
import 'package:listar_flux/widget/margin.dart';

class AddingControll extends StatelessWidget{
  final PickImage pickImage=PickImage();
  final Function addImage;

  AddingControll({Key key, @required this.addImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
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
                    (value) => showBottomSheetForName(parentContext,value));
              },
            ),
            ListTile(
                leading:
                    Icon(Icons.camera, color: Theme.of(context).primaryColor),
                title: Text("Take a photo"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage.imageFromCamera().then(
                      (value) =>  showBottomSheetForName(parentContext,value));
                }),
          ]),
        );
      },
    );
  }
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showBottomSheet(context);
        },
        tooltip: "Add Person",
      );
  }
  
}