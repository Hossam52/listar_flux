import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:listar_flux/widget/multi_image.dart';
import 'package:listar_flux/widget/margin.dart';

class Conversation extends StatefulWidget {
  final List<Chat> chat;

  const Conversation({Key key, this.chat}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ConversationState();
  }
}

class _ConversationState extends State<Conversation> {
  TextEditingController txtController;
  double width;
  ScrollController _controller;
  @override
  initState() {
    super.initState();
    txtController = TextEditingController();
  }

  Widget decorateMessage(String message, bool me) {
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
          child: Text(
            message,
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

  Widget me(String message, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Margin(
          margin: EdgeInsets.only(right: 10),
          child: Text(
            date,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        decorateMessage(message, true),
      ],
    );
  }

  Widget other(String message, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/person4.jpg"),
        ),
        Margin(
          child: decorateMessage(message, false),
        ),
        Text(
          date,
          style: TextStyle(color: Colors.grey),
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
              widget.chat.add(Chat(
                  message: txtController.text,
                  time: "Fri Oct 10 2020",
                  me: true));
              txtController.clear();
            });
          },
        ),
      ),
    );
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
            onPressed: () {},
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

  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Conversation"),
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
                    itemCount: widget.chat.length,
                    itemBuilder: (context, index) {
                      Chat chat = widget.chat[index];
                      return Margin(
                        margin: EdgeInsets.all(5),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: chat.me
                                ? me(chat.message, chat.time)
                                : other(chat.message, chat.time),
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
