import 'package:flutter/material.dart';
import 'package:listar_flux/models/message_module.dart';
import 'package:listar_flux/screens/conversation.dart';
import 'package:listar_flux/widget/margin.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<OuterMessageModule> conversations;
  @override
  initState() {
    super.initState();
    conversations = allConversations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onTap: () {
                        print("tapped $index");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Conversation(
                                  chat:conversations[index].conv.chat,
                                )));
                        conversations[index].conv;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize:MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black45,
                                radius: 33,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      conversations[index]
                                          .imagesAtThisConversation[0]),
                                ),
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
                                      Text(conversations[index].lastMessage,
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  )),
                            ],
                          ),
                          Text(conversations[index].time,
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
