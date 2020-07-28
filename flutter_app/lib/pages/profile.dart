import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'feature.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profiles = const [
      {'lead': 'H', 'caption': 'Home', 'subcaption': 'Food options near home'},
      {'lead': 'W', 'caption': 'Work', 'subcaption': 'Food around work'},
      {
        'lead': 'M',
        'caption': 'Town Center',
        'subcaption': 'Ordering for the movie'
      },
    ];
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: profiles.length,
      itemBuilder: (context, int index) {
        return Slidable(
          actions: <Widget>[
            IconSlideAction(
                icon: Icons.check_box,
                caption: 'Select',
                color: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Feature(),
                    ),
                  );
                }),
          ],
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text(
                '${profiles[index]['lead']}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            title: Text(
              '${profiles[index]['caption']}',
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              '${profiles[index]['subcaption']}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(Icons.arrow_forward),
          ),
          actionPane: SlidableDrawerActionPane(),
        );
      },
    );
  }
}
