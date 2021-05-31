import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/UsersProvider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    bool errorAvatar = false;

    final UsersProvider _prov = Provider.of(context);
    final avatar = user.avatar.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
            backgroundColor: Colors.grey,
          );
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.FORM,
                    arguments: user,
                  );
                },
                color: Colors.orange,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  _prov.remove(user.id);
                },
              ),
            ],
          ),
        ));
  }
}
