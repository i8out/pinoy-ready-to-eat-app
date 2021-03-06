import 'package:flutter/material.dart';
import 'package:flutter_app/models/store.dart';
import 'package:flutter_app/widgets/favorite_icon.dart';
import 'package:flutter_app/widgets/record_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class SelectStore extends StatefulWidget {
  SelectStore({Key key}) : super(key: key);

  @override
  _SelectStore createState() => _SelectStore();
}

class _SelectStore extends State<SelectStore> {
  SelectStoreBloc _bloc;

  @override
  void initState() {
    this._bloc = SelectStoreBloc();
    this._bloc.add(GetStores());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Color mapColors(String dataColor) {
    Color setColor;
    switch (dataColor) {
      case '0xFFFFF9C4':
        {
          setColor = const Color(0xFFFFA726);
        }
        break;
      case '0xFFFFCDD2':
        {
          setColor = const Color(0xFFEF5350);
        }
        break;
      case '0xFFB2DFDB':
        {
          setColor = const Color(0xFF66BB6A);
        }
        break;
      case '0xFFB3E5FC':
        {
          setColor = const Color(0xFF42A5F5);
        }
        break;
      default:
        {
          setColor = const Color(0xFF42A5F5);
        }
        break;
    }
    return setColor;
  }

  List<Store> _stores;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectStoreBloc, SelectStoreState>(
      bloc: this._bloc,
      listener: (context, state) {
        _stores = state.stores;
      },
      child: BlocBuilder<SelectStoreBloc, SelectStoreState>(
        bloc: this._bloc,
        builder: (context, state) {
          if (state is LoadError) {
            return Center(
              child: Text(
                'Load Error',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else if (state is DisplayPage) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: _stores.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 3.0,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => this._bloc.add(
                            LoadMeals(context, _stores[index].color),
                          ),
                      child: Column(
                        children: <Widget>[
                          RecordImage(_stores[index].image),
                          Text(
                            _stores[index].storeName,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: mapColors(_stores[index].color)),
                          ),
                          Text(
                            _stores[index].address1,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FavoriteIcon(_stores[index].rating),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
