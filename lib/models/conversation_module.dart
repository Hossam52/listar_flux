
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
  Chat(message:"me",me: true,time:"Fri Oct 10 2020"),
];
List<List<Chat>> allChats = [
 new List<Chat>.from(ch),
 new List<Chat>.from(ch),
 new List<Chat>.from(ch),
 new List<Chat>.from(ch),
];
