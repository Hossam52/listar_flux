import 'conversation_module.dart';

class OuterMessageModule {
  String lastMessage;
  String name;
  String time;
  List<String> imagesAtThisConversation;
  Conversation conv;
  OuterMessageModule({this.conv,this.name,this.lastMessage, this.time, this.imagesAtThisConversation});
}
List<OuterMessageModule> get allConversations {
  return _allConversations;
}
List<OuterMessageModule> _allConversations =[
  OuterMessageModule(name:"First",lastMessage:"FirstMessage",time:"20-2-2020",imagesAtThisConversation: ['assets/images/person1.jpg'],conv:conversation[0]),
  OuterMessageModule(name:"Second",lastMessage:"SecondMessage",time:"21-2-2020",imagesAtThisConversation: ['assets/images/person2.jpg'],conv:conversation[1]),
  OuterMessageModule(name:"Third",lastMessage:"ThirdMessage",time:"22-2-2020",imagesAtThisConversation: ['assets/images/person3.jpg'],conv:conversation[2]),
  OuterMessageModule(name:"Forth",lastMessage:"Forth Message",time:"23-2-2020",imagesAtThisConversation: ['assets/images/person4.jpg'],conv:conversation[3]),
];

