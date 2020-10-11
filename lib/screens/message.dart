import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:listar_flux/widget/multi_image.dart';
import 'package:listar_flux/models/message_module.dart';
import 'package:listar_flux/screens/conversation.dart';
import 'package:listar_flux/widget/margin.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  double width;
  List<OuterMessageModule> conversations;
  @override
  initState() {
    super.initState();
    conversations = allConversations;
  }
File cameraImage;
final picker = ImagePicker();
Future getImage({ImageSource source}) async {
final pickedFile = await picker.getImage(source: source);
setState(() {
cameraImage = File(pickedFile.path);
});
}

  Widget circleImage(List<String> imgPaths) {
    return CircleAvatar(
      radius:37,child: MultiImage(size: 100, imagePaths: imgPaths));
  }

  Widget convNameAndLastMessage(String name, Chat lastMessage) {
    return Margin(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.4),
            child: Row(
              children: [
                Text(
                  lastMessage.me ? "You: " : "Other: ",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Expanded(
                  child: Text(
                      lastMessage.type == MessageType.photo
                          ? "send image"
                          : lastMessage.message,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {getImage();}),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Messages"),
      ),
      body: Margin(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: conversations.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  OuterMessageModule conversation = conversations[index];
                  int chatLength = conversation.chat.length;
                  Chat lastMessage = conversation.chat[chatLength - 1];
                  return InkWell(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Conversation(
                                    module: conversation,
                                  )));
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            circleImage(conversation.imagesAtThisConversation),
                            convNameAndLastMessage(
                                conversation.name, lastMessage),
                          ],
                        ),
                        Text(
                          lastMessage.time,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
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
