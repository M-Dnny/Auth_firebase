import 'package:auth_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({required this.toggleView});
  final Function toggleView;

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //TextField State

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val!.isEmpty
                    ? 'Enter an Email'
                    : !val.contains('@')
                        ? 'Enter a Valid Email Address'
                        : null,
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (val) => val!.isEmpty
                    ? 'Enter Password'
                    : val.length < 8
                        ? 'Enter a Strong Password'
                        : null,
                decoration: InputDecoration(hintText: 'Enter Password'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    dynamic result =
                        await _auth.signinwithemailandpass(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'User Not Found';
                      });
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text("Already have an account? Sign In Now"),
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
