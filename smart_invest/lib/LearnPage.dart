import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  LearnPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LearnPagePageState createState() => LearnPagePageState();
}

class LearnPagePageState extends State<LearnPage> {
  static List<String> entries = <String>[
    'Stocks of the Month!',
    'Beginner Stocks Guide',
    'How to be Succesful?',
    'Setting up your preferences',
    'Making your First Trade',
  ];

  Icon iconState = Icon(Icons.play_circle_outline);
  int selectedIndex = 0;
  Icon ic = Icon(Icons.pause_circle_outline);
  int validEntry = 0;

  onSelected(int index) {
    //no repeat, if already paused change to play likewise change to pause if already playing
    if (selectedIndex == index) {
      selectedIndex = -1;
    } else {
      selectedIndex = index;
      validEntry = selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  child: Text(
                    entries[validEntry],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Padding(
                  child: Stack(
                    children: <Widget>[
                      Image(image: AssetImage('assets/images/vid1.jpg')),
                      Center(
                        heightFactor: 6,
                        child: Text(
                          "Video " + (validEntry + 1).toString(),
                          style:
                              TextStyle(color: Colors.white.withOpacity(1.0), fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(2),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          child: Text('${entries[index]}'),
                          padding: EdgeInsets.only(left: 10),
                        ),
                        IconButton(
                          icon: selectedIndex != null &&
                                  selectedIndex == index &&
                                  selectedIndex != -1
                              ? Icon(Icons.pause_circle_outline)
                              : Icon(Icons.play_circle_outline),
                          tooltip: 'Play Video',
                          onPressed: () {
                            setState(() {
                              onSelected(index);
                              //print(selectedIndex);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
