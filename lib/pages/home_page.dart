import 'package:aid_app/classes/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Home"),
          RaisedButton(
            child: Text("Sign out"),
            onPressed: () {
              context.read(authProvider).signOut();
            },
          )
        ],
      )),
    );
  }
}
