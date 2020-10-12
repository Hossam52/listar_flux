import 'package:listar_flux/models/person.dart';

import 'conversation_module.dart';

class OuterMessageModule {
  String name;
  List<Person> personsOnConversation;
  List<Chat> chat;
  OuterMessageModule({this.chat, this.name, this.personsOnConversation});
}

List<OuterMessageModule> allConversations = [
  OuterMessageModule(
      name: "First",
      personsOnConversation: [
        Person(imgPath: 'assets/images/person1.jpg', name: "Ahmed Salama"),
        Person(imgPath: 'assets/images/person2.jpg', name: "Hossam Hassan"),
        Person(imgPath: 'assets/images/person3.jpg', name: "Mohamed Hany"),
        Person(imgPath: 'assets/images/person4.jpg', name: "Ahmed Ashraf")
      ],
      chat: allChats[0]),
  OuterMessageModule(
      name: "Second",
      personsOnConversation: [
        Person(imgPath: 'assets/images/person2.jpg', name: "Ahmed Salama")
      ],
      chat: allChats[1]),
  OuterMessageModule(
      name: "Third",
      personsOnConversation: [
        Person(imgPath: 'assets/images/person3.jpg', name: "Ahmed Salama")
      ],
      chat: allChats[2]),
  OuterMessageModule(
      name: "Forth",
      personsOnConversation: [
        Person(imgPath: 'assets/images/person4.jpg', name: "Ahmed Salama")
      ],
      chat: allChats[3]),
];
