import 'package:flutter/material.dart';
import 'package:flutter_app/models/store.dart';
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
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            } else if (state is DisplayPage) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemCount: _stores.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.green,
                    child: InkWell(
                      onTap: () {
                        print(index);
                      },
                      child: Center(
                        child: Text(
                          _stores[index].storeName,
                          style: Theme.of(context).textTheme.headline5,
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
