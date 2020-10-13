import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:intl/intl.dart';
import 'package:listar_flux/models/message_module.dart';
import 'package:listar_flux/models/pick_image.dart';
import 'package:listar_flux/widget/margin.dart';

import '../conversation/full_screen_image.dart';
import 'chat_text_field.dart';
import 'default_app_bar.dart';
import 'delete_app_bar.dart';
import 'display_message.dart';

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
  List<int> itemsToBeDeleted;
  bool longPressOnItem;
  String _imgPath;
  TextEditingController txtController;
  double width;
  ScrollController _controller;
  @override
  initState() {
    super.initState();
    longPressOnItem = false;
    itemsToBeDeleted = List<int>();
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
        DisplayMessage(
          chat: chat,
        ),
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
          child: DisplayMessage(
            chat: chat,
          ),
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
                  message: txtController.text,
                  time: currentDate(),
                  sender: Sender.me));

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
    await (source == ImageSource.gallery
            ? takeImage.imageFromGallery()
            : takeImage.imageFromCamera())
        .then((value) => _imgPath = value);
    if (_imgPath != null) {
      animateToLastMessage();
      setState(() {
        widget.module.chat.add(Chat(
            message: txtController.text != "" ? txtController.text : null,
            imagePath: _imgPath,
            sender: Sender.me,
            type: MessageType.photo,
            time: currentDate()));
        _imgPath = null;
      });
    }
  }

  Widget whatToDisplayAtListView(Chat chat) {
    return chat.sender == Sender.me ? me(chat) : other(chat);
  }

  Color decideColor(int index) {
    if (longPressOnItem == false || itemsToBeDeleted.isEmpty)
      return null;
    else {
      if (itemsToBeDeleted.contains(index)) {
        return Colors.blue[100];
      }
      return null;
    }
  }

  void clearSelectedItems() {
    setState(() {
      itemsToBeDeleted.clear();
      longPressOnItem = !longPressOnItem;
    });
  }

  void removeIndex(int index) {
    widget.module.chat.removeAt(index);
  }

  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: longPressOnItem == true
            ? DeletedAppBar(
                itemsToBeDeleted: itemsToBeDeleted,
                removeIndexFromOriginalList: removeIndex,
                clearSelectedItems: clearSelectedItems,
              )
            : DefaultAppBar(
                name: widget.module.name,
                personsOnConversation: widget.module.personsOnConversation,
              ),
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
                                    if (itemsToBeDeleted.contains(index)) {
                                      itemsToBeDeleted.remove(index);
                                      if (itemsToBeDeleted.isEmpty)
                                        longPressOnItem = !longPressOnItem;
                                    } else
                                      itemsToBeDeleted.add(index);
                                    setState(() {});
                                  }
                                },
                                onLongPress: () {
                                  if (longPressOnItem) return;
                                  itemsToBeDeleted.add(index);
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
                  ChatTextField(
                    addImageToList: addImageToList,
                    txtController: txtController,
                  ),
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
