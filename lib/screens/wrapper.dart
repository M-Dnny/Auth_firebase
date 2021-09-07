import 'package:auth_firebase/models/user.dart';
import 'package:auth_firebase/screens/authenticate/authenticate.dart';
import 'package:auth_firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  // This is an anchor between the root app and the firebase auth
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    // Return Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
