import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/widgets/favorite_icon.dart';
import 'package:flutter_app/widgets/food_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SelectMeals extends StatefulWidget {
  final String _color;
  SelectMeals(this._color, {Key key}) : super(key: key);

  @override
  _SelectMeals createState() => _SelectMeals(this._color);
}

class _SelectMeals extends State<SelectMeals> {
  SelectMealsBloc _bloc;
  final String _color;

  _SelectMeals(
    this._color,
  );

  @override
  void initState() {
    this._bloc = SelectMealsBloc();
    this._bloc.add(GetMeals());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  List<Meal> _meals;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectMealsBloc, SelectMealsState>(
      bloc: this._bloc,
      listener: (context, state) {
        _meals = state.meals;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Meals',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              color: Colors.yellow,
            ),
          ),
          backgroundColor: Colors.red,
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
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: Icon(Icons.undo, color: Colors.white),
              onTap: () {
                this._bloc.add(
                      GetMeals(),
                    );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () => print('SECOND CHILD'),
            ),
          ],
        ),
        body: BlocBuilder<SelectMealsBloc, SelectMealsState>(
            bloc: this._bloc,
            builder: (context, state) {
              if (state is LoadMealsError) {
                return Center(
                  child: Text(
                    'Load Error',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                );
              } else if (state is DisplayMeals) {
                return SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            floating: true,
                            backgroundColor: Colors.white,
                            title: Text(
                              'tap & tap on item to order, reset if needed',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              childAspectRatio: 1.0,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Card(
                                  elevation: 3.0,
                                  color: mapColors(this._color),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _meals[index].orderQty += 1;
                                      });
                                      print(_meals[index].iD +
                                          " order " +
                                          _meals[index].orderQty.toString());
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        FoodImage(
                                            _meals[index].image,
                                            _meals[index].orderQty == 0
                                                ? ''
                                                : _meals[index]
                                                    .orderQty
                                                    .toString()),
                                        Text(
                                          _meals[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text(
                                          'P' + _meals[index].price,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: FavoriteIcon(
                                              _meals[index].rating),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              childCount: _meals.length,
                            ),
                          ),
                        ],
                      )),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Color mapColors(String dataColor) {
    print('meal ' + dataColor);
    Color setColor;
    switch (dataColor) {
      case '0xFFFFF9C4':
        {
          setColor = const Color(0xFFFFF9C4);
        }
        break;
      case '0xFFFFCDD2':
        {
          setColor = const Color(0xFFFFCDD2);
        }
        break;
      case '0xFFB2DFDB':
        {
          setColor = const Color(0xFFB2DFDB);
        }
        break;
      case '0xFFB3E5FC':
        {
          setColor = const Color(0xFFB3E5FC);
        }
        break;
      default:
        {
          setColor = const Color(0xFFBBDEFB);
        }
        break;
    }
    return setColor;
  }
}
