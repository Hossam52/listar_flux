import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:intl/intl.dart';
import 'package:listar_flux/models/message_module.dart';
import 'package:listar_flux/models/pick_image.dart';
import 'package:listar_flux/widget/margin.dart';
import 'package:listar_flux/widget/multi_image.dart';

import 'full_screen_image.dart';

class Conversation extends StatefulWidget {
  final OuterMessageModule module;

  const Conversation({Key key, @required this.module}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ConversationState();
  }
}

class _ConversationState extends State<Conversation> {
  PickImage takeImage;
  List<int> indexOfLongPressedItems;
  bool longPressOnItem;
  String _imgPath;
  TextEditingController txtController;
  double width;
  ScrollController _controller;
  @override
  initState() {
    super.initState();
    longPressOnItem = false;
    indexOfLongPressedItems = List<int>();
    takeImage = PickImage();

    _controller = ScrollController();
    txtController = TextEditingController();
    animateToLastMessage();
  }

  void animateToLastMessage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  Widget decorateMessage(String message, bool me, [String imagePath]) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: me ? width * 0.6 : width * 0.49,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: me ? Theme.of(context).primaryColor : Colors.grey,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: me ? Radius.zero : Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topLeft: me ? Radius.circular(15) : Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: imagePath != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    message == null
                        ? Container()
                        : Text(
                            message,
                            style: TextStyle(fontSize: 22),
                          ),
                    Margin(
                        margin: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FullScreenImage(imgPath: imagePath)));
                            },
                            child: Image.file(File(imagePath)))),
                  ],
                )
              : Text(
                  message,
                  style: TextStyle(fontSize: 22),
                ),
        ),
      ),
    );
  }

  Widget me(Chat chat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Margin(
          margin: EdgeInsets.only(right: 10),
          child: Text(
            chat.time,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        chat.type == MessageType.photo
            ? decorateMessage(chat.message, chat.me, chat.imagePath)
            : decorateMessage(chat.message, chat.me),
      ],
    );
  }

  Widget other(Chat chat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/person4.jpg"),
        ),
        Margin(
          child: chat.type == MessageType.photo
              ? decorateMessage(chat.message, chat.me, chat.imagePath)
              : decorateMessage(chat.message, chat.me),
        ),
        Expanded(
          child: Text(
            chat.time,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget sendWidget(context) {
    return Margin(
      margin: EdgeInsets.only(left: 20),
      child: CircleAvatar(
        radius: 25,
        child: IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            setState(() {
              widget.module.chat.add(Chat(
                  message: txtController.text, time: currentDate(), me: true));

              txtController.clear();
            });
            animateToLastMessage();
          },
        ),
      ),
    );
  }

  String currentDate() {
    final now = DateTime.now();
    String nowTime = DateFormat.jm().format(now);
    nowTime += " " + DateFormat.MMMd().format(now);
    return nowTime;
  }

  addImageToList(ImageSource source) async {
    await(source == ImageSource.gallery
            ? takeImage.imageFromGallery()
            : takeImage.imageFromCamera())
        .then((value) => _imgPath = value);
    if (_imgPath == null) {
      print(_imgPath);
      return;
    }
    animateToLastMessage();
    setState(() {
      widget.module.chat.add(Chat(
          message: txtController.text != "" ? txtController.text : null,
          imagePath: _imgPath,
          me: true,
          type: MessageType.photo,
          time: currentDate()));
      _imgPath = null;
    });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Margin(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                leading:
                    Icon(Icons.image, color: Theme.of(context).primaryColor),
                title: Text("Select from gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  addImageToList(ImageSource.gallery);
                },
              ),
              ListTile(
                  leading:
                      Icon(Icons.camera, color: Theme.of(context).primaryColor),
                  title: Text("Take a photo"),
                  onTap: () {
                    Navigator.pop(context);
                    addImageToList(ImageSource.camera);
                  }),
            ]),
          );
        });
  }

  Widget textField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: txtController,
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

  Widget whatToDisplayAtListView(Chat chat) {
    if (chat.me) {
      return me(chat);
    } else {
      return other(chat);
    }
  }

  Color decideColor(int index) {
    if (longPressOnItem == false || indexOfLongPressedItems.isEmpty)
      return null;
    else {
      if (indexOfLongPressedItems.contains(index)) {
        return Colors.blue[100];
      }
      return null;
    }
  }

  AppBar defaultAppBar() {
    return AppBar(
      leadingWidth: 30,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MultiImage(
              imagePaths: widget.module.imagesAtThisConversation, size: 50),
          Margin(child: Text(widget.module.name))
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.call), onPressed: () {}),
        IconButton(icon: Icon(Icons.videocam_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  AppBar deleteAppBar() {
    return AppBar(
      actions: [
        IconButton(
            icon: Icon(Icons.share, size: 40),
            onPressed: () {
              setState(() {
                longPressOnItem = !longPressOnItem;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.delete_forever,
              size: 40,
            ),
            onPressed: () {
              int temp = 0;
              indexOfLongPressedItems.sort();
              List<int> t = List<int>();
              for (int i = indexOfLongPressedItems.length - 1; i >= 0; i--) {
                t.add(indexOfLongPressedItems[i]);
                print(indexOfLongPressedItems[i].toString() + "\n");
              }
              for (int i = 0; i < indexOfLongPressedItems.length; i++) {
                // print(widget.module.chat);
                widget.module.chat.removeAt(indexOfLongPressedItems[i] - temp);
                temp++;
              }
              setState(() {
                indexOfLongPressedItems.clear();
                longPressOnItem = !longPressOnItem;
              });
            }),
        InkWell(
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              setState(() {
                indexOfLongPressedItems.clear();
                longPressOnItem = !longPressOnItem;
              });
            })
      ],
    );
  }

  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: longPressOnItem == true ? deleteAppBar() : defaultAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListView.builder(
                    controller: _controller,
                    itemCount: widget.module.chat.length,
                    itemBuilder: (context, index) {
                      Chat chat = widget.module.chat[index];
                      return Margin(
                        margin: EdgeInsets.all(5),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  if (longPressOnItem) {
                                    if (indexOfLongPressedItems
                                        .contains(index)) {
                                      indexOfLongPressedItems.remove(index);
                                      if (indexOfLongPressedItems.isEmpty)
                                        longPressOnItem = !longPressOnItem;
                                    } else
                                      indexOfLongPressedItems.add(index);
                                    setState(() {});
                                  }
                                },
                                onLongPress: () {
                                  if (longPressOnItem) return;
                                  indexOfLongPressedItems.add(index);
                                  setState(() {
                                    longPressOnItem = !longPressOnItem;
                                  });
                                },
                                child: Container(
                                    color: decideColor(index),
                                    child: whatToDisplayAtListView(chat))),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Margin(
              child: Row(
                children: [
                  textField(context),
                  sendWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
