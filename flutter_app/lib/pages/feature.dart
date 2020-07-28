import 'package:flutter/material.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/review.dart';
import 'package:flutter_app/pages/selectstore.dart';

class Feature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeatureState();
  }
}

class _FeatureState extends State<Feature> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SelectStore(),
    Review(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text(
          'Eateries',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            color: Colors.yellow,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Eats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            title: Text('Review'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            title: Text('Profiles'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
