import 'package:crud_flutter/provider/UsersProvider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/views/user_list.dart';
import 'package:crud_flutter/views/form_users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        title: 'Crud Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.FORM: (_) => FormUsers(),
        },
      ),
    );
  }
}
