import 'package:auth_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  static const String errormsg = 'Something is Wrong Please try again later 😊';
  static const String successmsg = 'Sign In Successfully';
  @override
  // This is a Screen with Sign In Button
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.signInAno();
                if (result == null) {
                  print(errormsg);
                } else {
                  print(successmsg);
                  print(result.uid);
                }
              },
              child: Text('Sign In with Guest Account'),
            ),
          ],
        ),
      ),
    );
  }
}
