import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Widget CaffesAndRooms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/c1.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),
                width: 130,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Lounge Coffee',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(' Arts & Humanities'),
                  Row(
                    children: [
                      Card(
                        child: Text(" 4.5 "),
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/r1.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),
                width: 130,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Lounge Coffee',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(' Arts & Humanities'),
                  Row(
                    children: [
                      Card(
                        child: Text(" 4.5 "),
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/r4.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),
                width: 130,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Royal Room',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(' Arts & Humanities'),
                  Row(
                    children: [
                      Card(
                        child: Text(" 4.0 "),
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/r3.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),
                width: 130,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Adorable Room',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(' Arts & Humanities'),
                  Row(
                    children: [
                      Card(
                        child: Text(" 5.0 "),
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/r2.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),
                width: 130,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Vallejo Guest Room',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(' Arts & Humanities'),
                  Row(
                    children: [
                      Card(
                        child: Text(" 4.0 "),
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: width,
            height: 220,
            color: Colors.white,
            child: Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              dotSize: 6.0,
              dotIncreasedColor: Color(0xFFFF335C),
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.bottomCenter,
              dotVerticalPadding: 10.0,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              images: [
                AssetImage("assets/images/pic1.jpg"),
                AssetImage("assets/images/pic2.jpg"),
                AssetImage("assets/images/pic3.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.redAccent, width: 2)),
              elevation: 0,
              color: Colors.white,
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Search Location",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.redAccent,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 7),
            child: Column(
              children: [
                Row(
                  children: [
                    MyIcon(Icons.shopping_basket, "Shops", Colors.red),
                    SizedBox(
                      width: width / 10,
                    ),
                    MyIcon(Icons.star_sharp, "Coffee", Colors.black),
                    SizedBox(
                      width: width / 10,
                    ),
                    MyIcon(
                        Icons.event_sharp, "Events", Colors.deepPurpleAccent),
                    SizedBox(
                      width: width / 10,
                    ),
                    MyIcon(Icons.autorenew, "State", Colors.blue),
                    SizedBox(
                      width: width / 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: width / 10,
                ),
                Row(
                  children: [
                    MyIcon(Icons.work, "Jobs", Colors.blueGrey),
                    SizedBox(
                      width: width / 10,
                    ),
                    MyIcon(Icons.restaurant, "Food", Colors.greenAccent),
                    SizedBox(
                      width: width / 10,
                    ),
                    MyIcon(Icons.car_rental, "Cars", Colors.yellow),
                    SizedBox(
                      width: width / 10,
                    ),
                    MyIcon(Icons.more_horiz_outlined, "More", Colors.redAccent),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular Location\n",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Let find out what most interesting things"),
                SizedBox(
                  height: 19,
                ),
                Container(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "AMERICA",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/tv1.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 1,
                            ),
                          ),
                          width: 120,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'CHINA',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/tv2.jpeg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 1,
                            ),
                          ),
                          width: 120,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'JAPAN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/tv3.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 1,
                            ),
                          ),
                          width: 120,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'PYRAMIDS',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/tv4.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 1,
                            ),
                          ),
                          width: 120,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  height: 150,
                  width: width,
                ),
                Text(
                  '\nRecent Location\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('Whats that could happen\n'),
                widget.CaffesAndRooms(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget MyIcon(icon, txt, col) {
  return Column(
    children: [
      InkWell(
        onTap: () {},
        child: CircleAvatar(
          child: Icon(icon),
          backgroundColor: col,
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(txt),
    ],
  );
}
