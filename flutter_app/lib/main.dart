import 'package:flutter/material.dart';
import 'package:flutter_app/pages/feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: TextStyle(color: Colors.white),
        ),
      ),
      home: BlocProvider(
        create: (BuildContext context) {},
        child: Feature(),
      ),
    );
  }
}
