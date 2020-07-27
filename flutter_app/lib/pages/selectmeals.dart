import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/widgets/food_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
          title: Text('Select Meals'),
        ),
        body: BlocBuilder<SelectMealsBloc, SelectMealsState>(
          bloc: this._bloc,
          builder: (context, state) {
            if (state is MealsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadMealsError) {
              return Center(
                child: Text(
                  'Load Error',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4),
                ),
              );
            } else if (state is DisplayMeals) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemCount: _meals.length,
                    itemBuilder: (context, index) => Card(
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
                            FoodImage(_meals[index].image,
                                _meals[index].orderQty.toString()),
                            Text(
                              _meals[index].name,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.headline5),
                            ),
                            Text(
                              _meals[index].price,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
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
