import 'package:flutter/material.dart';

class WhiteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Column(
              children: [
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                            ' Vallejo Guest Room',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                            ' Vallejo Guest Room',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                            ' Vallejo Guest Room',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget showscroll() {
  return Text("Loading...");
}
