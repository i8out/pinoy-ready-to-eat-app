import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/widgets/record_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class SelectMeals extends StatefulWidget {
  SelectMeals({Key key}) : super(key: key);

  @override
  _SelectMeals createState() => _SelectMeals();
}

class _SelectMeals extends State<SelectMeals> {
  SelectMealsBloc _bloc;

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
                  style: Theme.of(context).textTheme.headline4,
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
                      color: Colors.yellow[100],
                      child: InkWell(
                        onTap: () {
                          print(_meals[index].iD);
                        },
                        child: Column(
                          children: <Widget>[
                            RecordImage(_meals[index].image),
                            Text(
                              _meals[index].name,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              _meals[index].price,
                              style: Theme.of(context).textTheme.subtitle1,
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
}
