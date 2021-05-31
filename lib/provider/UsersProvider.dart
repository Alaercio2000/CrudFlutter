import 'dart:math';

import 'package:crud_flutter/data/users.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user.toString().isEmpty) {
      return;
    }

    if (_items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatar: user.avatar,
              ));
    }

    notifyListeners();
  }

  void remove(String id) {
    if (id.isNotEmpty) {
      _items.remove(id);
      notifyListeners();
    }
  }
}
