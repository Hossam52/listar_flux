import 'dart:io';

import 'package:flutter/material.dart';
import 'package:listar_flux/models/conversation_module.dart';
import 'package:listar_flux/widget/margin.dart';

import 'full_screen_image.dart';

class DisplayMessage extends StatelessWidget {
  final Chat chat;

  const DisplayMessage({Key key, @required this.chat}) : super(key: key);

  Widget _buildImage(context){
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    chat.message == null
                        ? Container()
                        : Text(
                            chat.message,
                            style: TextStyle(fontSize: 22),
                          ),
                    Margin(
                        margin: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreenImage(
                                          imgPath: chat.imagePath)));
                            },
                            child: Image.file(File(chat.imagePath)))),
                  ],
                );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: chat.sender == Sender.me ? width * 0.6 : width * 0.49,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: chat.sender == Sender.me
                ? Theme.of(context).primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: chat.sender == Sender.me
                    ? Radius.zero
                    : Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topLeft: chat.sender == Sender.me
                    ? Radius.circular(15)
                    : Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: chat.type == MessageType.photo ||
                  chat.type == MessageType.photoAndText
              ? _buildImage(context)
              : Text(
                  chat.message,
                  style: TextStyle(fontSize: 22),
                ),
        ),
      ),
    );
  }
}
