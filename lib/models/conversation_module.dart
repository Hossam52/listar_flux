enum MessageType {
  photo,
  text,
  photoAndText,
}
enum Sender {
  me,
  other,
}

class Chat {
  String message;
  String imagePath;Sender sender;
  String time;
  MessageType type;
  Chat(
      {this.message,
      this.sender,
      this.imagePath,
      this.time = "",
      this.type = MessageType.text});
}

List<Chat> ch = [
  Chat(message: "Hello my firend", sender: Sender.me, time: "Fri Oct 9 2020"),
  Chat(message: "Hello my firend2", sender: Sender.other, time: "Fri Oct 9 2020"),
  Chat(message: "sender", sender: Sender.me, time: "Fri Oct 9 2020"),
  Chat(message: "receiver", sender: Sender.other, time: "Fri Oct 9 2020"),
  Chat(message: "Hello sender", sender: Sender.me, time: "Fri Oct 9 2020"),
  Chat(message: "sender", sender: Sender.me, time: "Fri Oct 9 2020"),
  Chat(message: "reciver", sender: Sender.other, time: "Fri Oct 9 2020"),
  Chat(message: "reciever", sender: Sender.other, time: "Fri Oct 9 2020"),
  Chat(message: "me", sender: Sender.me, time: "Fri Oct 10 2020"),
];
List<List<Chat>> allChats = [
  new List<Chat>.from(ch),
  new List<Chat>.from(ch),
  new List<Chat>.from(ch),
  new List<Chat>.from(ch),
];
