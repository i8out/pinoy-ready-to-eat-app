import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpinvalidation/bloc/bloc.dart';

class SelectStore extends StatefulWidget {
  SelectStore({Key key}) : super(key: key);

  @override
  _KeypadState createState() => _KeypadState();
}

class _KeypadState extends State<SelectStore> {
  SelectStoreBloc _bloc;

  @override
  void initState() {
    this._bloc = SelectStoreBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  String _displayPin = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectStoreBloc, SelectStoreState>(

    );}}