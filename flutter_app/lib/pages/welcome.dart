import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import 'feature.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _Welcome createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  WelcomeBloc _bloc;

  @override
  void initState() {
    this._bloc = WelcomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

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

  List<String> _items;
  bool _showHistory = true;
  final _historyItems = const [
    '25 May 2020  Aling Nelia',
    '24 May 2020  Aling Nelia',
    '22 May 2020  Two Sisters',
  ];
  final _statusItems = const [
    'No pending orders',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      bloc: this._bloc,
      listener: (context, state) {
        _showHistory = state.showHistory;
      },
      child: BlocBuilder<WelcomeBloc, WelcomeState>(
        bloc: this._bloc,
        builder: (context, state) {
            if (_showHistory) {
              _items = _historyItems;
            } else {
              _items = _statusItems;
            }
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
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: Text(
                                    _items[0],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: Text(
                                    _items[1],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: Text(
                                    _items[2],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height / 2.8,
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
                        bottom: 8,
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: _showHistory
                                  ? Colors.yellow[100]
                                  : Colors.grey,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: FlatButton(
                              onPressed: () => this._bloc.add(
                                    HistoryPressed(),
                                  ),
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
                              color: !_showHistory
                                  ? Colors.yellow[100]
                                  : Colors.grey,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: FlatButton(
                              onPressed: () => this._bloc.add(
                                    StatusPressed(),
                                  ),
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
          },
      ),
    );
  }
}
