import 'conversation_module.dart';

class OuterMessageModule {
  String name;
  List<String> imagesAtThisConversation;
  List<Chat> chat;
  OuterMessageModule({this.chat,this.name, this.imagesAtThisConversation});
}
List<OuterMessageModule> allConversations =[
  OuterMessageModule(name:"First",imagesAtThisConversation: ['assets/images/person1.jpg','assets/images/person2.jpg','assets/images/person3.jpg','assets/images/person4.jpg'],chat:allChats[0]),
  OuterMessageModule(name:"Second",imagesAtThisConversation: ['assets/images/person2.jpg'],chat:allChats[1]),
  OuterMessageModule(name:"Third",imagesAtThisConversation: ['assets/images/person3.jpg'],chat:allChats[2]),
  OuterMessageModule(name:"Forth",imagesAtThisConversation: ['assets/images/person4.jpg'],chat:allChats[3]),
];

