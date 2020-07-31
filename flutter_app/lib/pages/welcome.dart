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
          color: Colors.yellow[100],
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/noon_time.jpg',
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.yellow[800],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 8,
                child: Text('Hi Joel,',
                    style: TextStyle(
                      letterSpacing: 4,
                      fontFamily: 'Lato',
                      fontSize: 42,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                top: 230,
                left: 24,
                child: Text('Lunch for?',
                    style: TextStyle(
                      letterSpacing: 4,
                      fontFamily: 'Lato',
                      fontSize: 38,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.4,
                left: MediaQuery.of(context).size.width / 7,
                child: MaterialSegmentedControl(
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
              ),
              Positioned(
                left: 0,
                bottom: 48,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 90,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            '25 May 2020  Aling Nelia',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            '24 May 2020  Aling Nelia',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            '22 May 2020  Two Sisters',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 8,
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        print('Pressed 1');
                      },
                      child: Text(
                        'Order History',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 8,
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        print('Pressed 2');
                      },
                      child: Text(
                        'Order Status',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
