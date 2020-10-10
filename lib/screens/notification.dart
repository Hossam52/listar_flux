import 'package:flutter/material.dart';

final KTextStyle = TextStyle(fontSize: 15.7, fontWeight: FontWeight.bold);

class Notifications extends StatelessWidget {
  //list of items
  List<DetailsNotification> listOfDetails = [
    DetailsNotification(
      icon: Icons.shopping_basket,
      title: 'Tiger Nixon',
      color: Colors.deepOrange,
    ),
    DetailsNotification(
      icon: Icons.wine_bar,
      title: 'Garrett Winters',
      color: Colors.grey,
    ),
    DetailsNotification(
      icon: Icons.work,
      title: 'Ashton Cox',
      color: Colors.purple,
    ),
    DetailsNotification(
      icon: Icons.card_travel,
      title: 'Brielle Williamson',
      color: Colors.indigo,
    ),
    DetailsNotification(
      icon: Icons.restaurant,
      title: 'Herrod Chandler',
      color: Colors.green,
    ),
    DetailsNotification(
        icon: Icons.directions_car,
        title: 'Jena Gaines',
        color: Colors.yellow[700]),
    DetailsNotification(
        icon: Icons.home, title: 'Cadric Kelly', color: Colors.blueAccent),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: Text("Notifications"),
      ),
      body: ListView.builder(
          itemCount: listOfDetails.length,
          itemBuilder: (ctx, i) {
            return NotificationItem(listOfDetails[i]);
          }),
    );
  }
}

class DetailsNotification {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final String data;
  DetailsNotification(
      {this.color,
      this.data = '12:00, Feb 16 2019',
      this.icon,
      this.subtitle = 'Excellence. Simply Deliverd',
      this.title});
}

//widgetItem
class NotificationItem extends StatelessWidget {
  final DetailsNotification detailsNotification;
  NotificationItem(this.detailsNotification);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(
                detailsNotification.icon,
                color: Colors.white,
              ),
              backgroundColor: detailsNotification.color,
              radius: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(detailsNotification.title, style: KTextStyle),
            Text(
              detailsNotification.subtitle,
              style: TextStyle(
                fontSize: 14.1,
                color: Colors.grey,
              ),
            ),
          ]),
          //Spacer(),
          Container(
              width: 105,
              child: FittedBox(
                  child: Text(
                detailsNotification.data,
                style: TextStyle(color: Colors.grey),
              ))),
        ],
      ),
    );
  }
}
