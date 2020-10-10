class Conversation {
  List<String> sender = List<String>();
  List<String> reciever = List<String>();
  List<Chat>chat;
  Conversation({this.sender, this.reciever,this.chat});
}
class Chat{
  String message;
  bool me;
  String time;
  Chat({this.message,this.me,this.time=""});
}

List<Chat> ch =[
  Chat(message:"Hello my firend",me: true,time:"Fri Oct 9 2020"),
  Chat(message:"Hello my firend2",me: false,time:"Fri Oct 9 2020"),
  Chat(message:"sender",me: true,time:"Fri Oct 9 2020"),
  Chat(message:"receiver",me: false,time:"Fri Oct 9 2020"),
  Chat(message:"Hello sender",me: true,time:"Fri Oct 9 2020"),
  Chat(message:"sender",me: true,time:"Fri Oct 9 2020"),
  Chat(message:"reciver",me: false,time:"Fri Oct 9 2020"),
  Chat(message:"reciever",me: false,time:"Fri Oct 9 2020"),
  Chat(message:"me",me: true),
];
List<String> _sender = ["a", "b", "d", "e", "f", "g", "h", "i"];
List<String> _reciever = ["j", "k", "l", "m", "n", "o", "p", "q"];

List<Conversation> get conversation{
  return _conv;
}
List<Conversation> _conv = [
  Conversation(sender: _sender, reciever: _reciever,chat: ch),
  Conversation(sender: _sender, reciever: _reciever,chat: ch),
  Conversation(sender: _sender, reciever: _reciever,chat: ch),
  Conversation(sender: _sender, reciever: _reciever,chat: ch),
];
