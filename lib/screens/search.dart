import 'package:flutter/material.dart';

void main() => runApp(Search());

class Search extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Search> {
  List names1 = [
    'Lexus Room',
    'Triple Room',
    'VIP Room',
    'king Room',
    'single Room',
    'Stand Room'
  ];
  List names2 = [
    'Michigan',
    'Colorado',
    'Utah',
    'king Utah',
    'Colorado',
  ];
  List<Widget> pages1 = [
    //Pages1_1(),
    //Pages1_2(),
    //Pages1_3(),
    //Pages1_4(),
    //Pages1_5(),
    //Pages1_6(),
  ];
  List<Widget> pages2 = [
    //Pages1_1(),
    //Pages1_2(),
    //Pages1_3(),
    //Pages1_4(),
    //Pages1_5(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Search"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    names1.clear();
                    names2.clear();

                    names1.insert(0, 'Lexus Room');
                    names1.insert(1, 'Triple Room');
                    names1.insert(2, 'VIP Room');
                    names1.insert(3, 'king Room');
                    names1.insert(4, 'single Room');
                    names1.insert(5, 'Stand Room');

                    names2.insert(0, 'Michigan');
                    names2.insert(1, 'Colorado');
                    names2.insert(2, 'Utah');
                    names2.insert(3, 'king Utah');
                    names2.insert(4, 'Colorado');
                  });
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Flexible(
              flex: 1,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        "\n SEARCH HISTORY",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      Spacer(),
                      InkWell(
                        child: Text(
                          "\nClear  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),
                        ),
                        onTap: () {
                          setState(() {
                            names1.clear();
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 600,
                    height: 130,
                    child: GridView.builder(
                        itemCount: names1.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3,
                            crossAxisSpacing: 3,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(

                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return pages1[index];
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(children: [
                                Text("${names1[index]}"),
                                IconButton(
                                    color: Colors.red,
                                    icon: Icon(
                                      Icons.clear,
                                      size: 15,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        names1.removeAt(index);
                                      });
                                    }),
                              ]),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "\n DISCOVER MORE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      Spacer(),
                      InkWell(
                        child: Text(
                          "\nClear  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),
                        ),
                        onTap: () {
                          setState(() {
                            names2.clear();
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    height: 100,
                    child: GridView.builder(
                        itemCount: names2.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3,
                            crossAxisSpacing: 5,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return pages2[index];
                              }));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${names2[index]}"),
                                      IconButton(
                                          color: Colors.red,
                                          icon: Icon(
                                            Icons.clear,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              names2.removeAt(index);
                                            });
                                          })
                                    ])),
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\n RECENTLY VIEWED",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 500,
                    height: 100,
                    child: ListView(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Michign',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/r1.jpg'),
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
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Colorado',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/r2.jpg'),
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
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Utah',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/r3.jpg'),
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
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'King Utah',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/r4.jpg'),
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
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Egypt',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
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
                      ],
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
