import 'package:flutter/material.dart';
import 'package:flutter_app/pages/profile.dart';
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
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Ready To Eat'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Stores'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            title: Text('Profile'),
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
