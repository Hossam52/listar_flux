import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listar_flux/widget/margin.dart';

class ChatTextField extends StatefulWidget{
  final TextEditingController txtController;
  final Function addImageToList;

  const ChatTextField({Key key,@required this.addImageToList, @required this.txtController}) : super(key: key);
@override
  State<StatefulWidget> createState() {
  return _ChatTextFieldState();
  }
}
class _ChatTextFieldState extends State<ChatTextField>{

  
  void showBottomSheet(BuildContext context) {
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
                widget.addImageToList(ImageSource.gallery);
              },
            ),
            ListTile(
                leading:
                    Icon(Icons.camera, color: Theme.of(context).primaryColor),
                title: Text("Take a photo"),
                onTap: () {
                  Navigator.pop(context);
                  widget.addImageToList(ImageSource.camera);
                }),
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   return  Expanded(
      child: TextField(
        controller: widget.txtController,
        style: TextStyle(fontSize: 19),
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: "Type something ...",
          contentPadding: EdgeInsets.only(top: 7, bottom: 7),
          suffixIcon: IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () async {
              showBottomSheet(context);
            },
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.emoji_emotions,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

}