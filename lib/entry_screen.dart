import 'package:flutter/Material.dart';
import 'package:listar_flux/screens/account.dart';
import 'package:listar_flux/screens/home.dart';
import 'package:listar_flux/screens/message.dart';
import 'package:listar_flux/screens/notification.dart';
import 'package:listar_flux/screens/whiteList.dart';

class ListarFlux extends StatefulWidget {
  @override
  _ListarFluxState createState() => _ListarFluxState();
}

class _ListarFluxState extends State<ListarFlux> {
  List<Widget> screens = [
    Home(),
    WhiteList(),
    Messages(),
    Notifications(),
    Account()
  ];
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "WhiteList"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Accounnt"),
        ],
      ),
      body: screens[index],
    );
  }
}
