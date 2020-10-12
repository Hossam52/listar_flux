import 'package:flutter/material.dart';

import 'account.dart';

class SignUp extends StatelessWidget {
  static String routeName = 'SignUp';
  final _form = GlobalKey<FormState>();
  final TextEditingController _emial = TextEditingController();
  final TextEditingController _username = TextEditingController();
   bool showPassword = true;

  void saved(BuildContext context) {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      Navigator.of(context).pushNamed(Account.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emial,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _emial.clear();
                        }),
                  ),
                  validator: (email) {
                    if (email.isEmpty)
                      return 'Please Enter Email';
                    else if (!email.contains('@') || !email.endsWith('com'))
                      return 'Please Enter Valid Email like this Example@gmail.com';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter Your Username',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _username.clear();
                          })),
                  validator: (username) {
                    if (username.isEmpty) return 'Please Enter your Username';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Please Enter Your Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          showPassword = !showPassword;
                        },
                        icon: Icon(showPassword
                            ? Icons.remove_red_eye
                            : Icons.remove_moderator),
                      )),
                  obscureText: showPassword,
                  validator: (password) {
                    if (password.isEmpty) return 'Please Enter Password';
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    saved(context);
                  },
                  child: Text('Sign Up'),
                  color: Colors.deepOrange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
