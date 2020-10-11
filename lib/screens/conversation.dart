import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:intl/intl.dart';
import 'package:listar_flux/models/message_module.dart';
import 'package:listar_flux/widget/margin.dart';
import 'package:listar_flux/widget/multi_image.dart';

class Conversation extends StatefulWidget {
  final OuterMessageModule module;

  const Conversation({Key key, @required this.module}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ConversationState();
  }
}

class _ConversationState extends State<Conversation> {
  File selectedImage;
  TextEditingController txtController;
  double width;
  ScrollController _controller;
  @override
  initState() {
    super.initState();

    _controller = ScrollController();
    txtController = TextEditingController();
    animateToLastMessage();
  }

  Future _imgFromGallery() async {
     await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      // if (res == null)
      //   print("Not seleccted");
      // else
      //   selectedImage = File(res.path);
    });
  }

  void animateToLastMessage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //_controller.jumpTo(_controller.position.maxScrollExtent);
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
            // image: imagePath!=null?DecorationImage(image: null):DecorationImage(image: null),
            color: me ? Theme.of(context).primaryColor : Colors.grey,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: me ? Radius.zero : Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topLeft: me ? Radius.circular(15) : Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: imagePath != null
              ? Image.asset(imagePath)
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
            ? decorateMessage(chat.message, chat.me, chat.message)
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
              ? decorateMessage(chat.message, chat.me, chat.message)
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

  Widget textField() {
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
            onPressed: 
            () {
              animateToLastMessage();
              setState(() {
                widget.module.chat.add(Chat(
                    message: "assets/images/person2.jpg",
                    me: false,
                    type: MessageType.photo,
                    time: currentDate()));
              });
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

  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Row(
            mainAxisSize:MainAxisSize.min,
            children: [
              MultiImage(imagePaths: widget.module.imagesAtThisConversation,size:50),
              Margin(child: Text(widget.module.name))
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            IconButton(icon: Icon(Icons.videocam_outlined), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
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
                            child: whatToDisplayAtListView(chat),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Margin(
              child: Row(
                children: [
                  textField(),
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
