import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/UsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormUsers extends StatelessWidget {
  final Map<String, String> _formData = {"id": ""};

  final _form = GlobalKey<FormState>();

  void _loadData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatar'] = user.avatar;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as User
        : null;

    if (user != null) {
      _loadData(user);
    }

    final UsersProvider _prov = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("FORM"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                initialValue: _formData['name'],
                validator: (value) {
                  if (value!.isEmpty || value.trim().length < 3) {
                    return "O nome tem que ter 3 caracteres ou mais";
                  }
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
                initialValue: _formData['email'],
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Url do avatar",
                ),
                initialValue: _formData['avatar'],
                onSaved: (value) => _formData['avatar'] = value!,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {
                    final bool isValid = _form.currentState!.validate();

                    if (isValid) {
                      _form.currentState!.save();
                      _prov.put(
                        User(
                          id: _formData['id']!.isEmpty ? "" : _formData['id']!,
                          name: _formData['name']!,
                          email: _formData['email']!,
                          avatar: _formData['avatar']!,
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Salvar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
