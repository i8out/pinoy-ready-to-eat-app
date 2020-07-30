import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import 'feature.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeState();
  }
}

class WelcomeState extends State<Welcome> {
  final Map<int, Widget> _children = const <int, Widget>{
    0: Text('     Home     ',
        style: TextStyle(
            fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold)),
    1: Text('     Work     ',
        style: TextStyle(
            fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold)),
    2: Text('    Near by    ',
        style: TextStyle(
            fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold)),
  };
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eateries Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Eateries',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              color: Colors.yellow,
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/images/noon_time.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    bottom: 58,
                    left: 8,
                    child: Text('Hi Joel,',
                        style: TextStyle(
                          letterSpacing: 4,
                          fontFamily: 'Lato',
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 24,
                    child: Text('Lunch for?',
                        style: TextStyle(
                          letterSpacing: 4,
                          fontFamily: 'Lato',
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              SizedBox(height: 16),
              MaterialSegmentedControl(
                horizontalPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                children: _children,
                selectionIndex: _currentSelection,
                borderColor: Colors.grey,
                selectedColor: Colors.red,
                unselectedColor: Colors.white,
                onSegmentChosen: (index) {
                  setState(
                    () {
                      _currentSelection = index;
                      print(index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Feature(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
