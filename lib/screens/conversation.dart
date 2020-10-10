import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:listar_flux/widget/margin.dart';

class Conversation extends StatefulWidget {
  final List<String> sender;
  final List<String> reciever;
  final List<Chat> chat;

  const Conversation({Key key, this.sender, this.reciever, this.chat})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ConversationState();
  }
}

class _ConversationState extends State<Conversation> {
  double width;
ScrollController _controller;
  @override
  initState(){
    super.initState();
    }

  Widget decorateMessage(String message, bool me) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width * 0.5,
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
        Margin(child: decorateMessage(message, false)),
        Text(
          date,
          style: TextStyle(color: Colors.grey),
        ),
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
        appBar: AppBar(
          title: Text("Conversation"),
          actions: [
            IconButton(icon:Icon(Icons.call),onPressed:(){}),
            IconButton(icon:Icon(Icons.videocam_outlined),onPressed:(){}),
            IconButton(icon:Icon(Icons.more_vert),onPressed:(){}),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (Chat chat in widget.chat)
                        Margin(
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: chat.me
                                  ? me(chat.message, chat.time)
                                  : other(chat.message, chat.time),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Margin(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
