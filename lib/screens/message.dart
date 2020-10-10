import 'package:flutter/material.dart';
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
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Conversation(
                                      chat: conversations[index].chat,
                                    )));
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black45,
                                radius: 33,
                                child: MultiImage(size:100,imagePaths: conversations[index]
                                          .imagesAtThisConversation)
                                  
                              ),
                              Margin(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(conversations[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: width * 0.4),
                                        child: Row(
                                          children: [
                                            Text(
                                              conversations[index]
                                                      .chat[conversations[index]
                                                              .chat
                                                              .length -
                                                          1]
                                                      .me
                                                  ? "You: "
                                                  : "Other: ",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  conversations[index]
                                                      .chat[conversations[index]
                                                              .chat
                                                              .length -
                                                          1]
                                                      .message,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Text(
                              conversations[index]
                                  .chat[conversations[index].chat.length - 1]
                                  .time,
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
