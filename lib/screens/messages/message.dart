import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:listar_flux/models/person.dart';
import 'package:listar_flux/screens/messages/person_at_conversation/persons_on_conversation.dart';
import 'package:listar_flux/widget/multi_image.dart';
import 'package:listar_flux/models/message_module.dart';
import 'package:listar_flux/screens/messages/conversation/conversation.dart';
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

  Widget circleImage(List<Person> imgPaths) {
    return GestureDetector(
      onTap:()async{
        await Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonOnConversation(images:imgPaths)));
        setState((){});
      },
          child: CircleAvatar(
        radius: 37,
        child: MultiImage(size: 100, imagePaths: imgPaths),
      ),
    );
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
            child: lastMessage == null
                ? Container()
                : Row(
                    children: [
                      Text(
                        lastMessage.sender==Sender.me ? "You: " : "Other: ",
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
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
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
                  Chat lastMessage = chatLength == 0
                      ? null
                      : conversation.chat[chatLength - 1];
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
                            circleImage(conversation.personsOnConversation),
                            convNameAndLastMessage(
                                conversation.name, lastMessage),
                          ],
                        ),
                        lastMessage == null
                            ? Container()
                            : Text(
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
