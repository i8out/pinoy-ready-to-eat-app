import 'package:flutter/material.dart';
import 'package:flutter_app/models/store.dart';
import 'package:flutter_app/widgets/record_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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

  List<Store> _stores;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectStoreBloc, SelectStoreState>(
      bloc: this._bloc,
      listener: (context, state) {
        _stores = state.stores;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Kitchen'),
        ),
        body: BlocBuilder<SelectStoreBloc, SelectStoreState>(
          bloc: this._bloc,
          builder: (context, state) {
            if (state is PageLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadError) {
              return Center(
                child: Text(
                  'Load Error',
                  style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline4),
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
                        mainAxisSpacing: 4.0),
                    itemCount: _stores.length,
                    itemBuilder: (context, index) => Card(
                      color: mapColors(_stores[index].color),
                      child: InkWell(
                        onTap: () => this
                            ._bloc
                            .add(LoadMeals(context, _stores[index].color)),
                        child: Column(
                          children: <Widget>[
                            RecordImage(_stores[index].image),
                            Text(
                              _stores[index].storeName,
                              style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline5),
                            ),
                            Text(
                              _stores[index].address1,
                              style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.subtitle1),
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
    print('me ' + dataColor);
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
