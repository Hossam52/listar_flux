import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  static String routeName = 'ForgetPassword';
  void saved(BuildContext ctx) {
    if (_form.currentState.validate()) Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Forget Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', hintText: 'Enter Your Email'),
                      validator: (email) {
                        if (email.isEmpty)
                          return 'Please Enter Email';
                        else if (!email.contains('@') || !email.endsWith('com'))
                          return 'Please Enter Valid Email like this Example@gmail.com';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Colors.deepOrange,
                      onPressed: () {
                        saved(context);
                      },
                      child: Text('Reset Password'),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
