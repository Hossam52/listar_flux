import 'package:flutter/material.dart';
import 'package:listar_flux/screens/ForgetPassword.dart';
import 'package:listar_flux/screens/SignUp.dart';

final KStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

class Account extends StatefulWidget {
  static String routeName = 'Account';
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  TextEditingController _userController = TextEditingController();
  final _form = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  var toggleAppearPassword = true;
  @override
  void initState() {
    _userController.text = "hany";
    super.initState();
  }

  void saved() {
    if (_form.currentState.validate())
      print('Success');
    else
      print('Errors');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Account"),
          backgroundColor: Colors.pinkAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _form,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _userController,
                        decoration: InputDecoration(
                            hintText: 'Enter Your UserName',
                            labelText: 'UserName',
                            fillColor: Colors.grey,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                if (_userController.text.isEmpty != true)
                                  _userController.clear();
                              },
                            )),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(focusNode);
                        },
                        textInputAction: TextInputAction.next,
                        validator: (username) {
                          if (username.isEmpty) return 'Please Enter UserName';
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: '123456',
                        decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(toggleAppearPassword
                                  ? Icons.remove_red_eye
                                  : Icons.panorama_fish_eye),
                              onPressed: () {
                                setState(() {
                                  toggleAppearPassword = !toggleAppearPassword;
                                });
                              },
                            )),
                        textInputAction: TextInputAction.done,
                        focusNode: focusNode,
                        obscureText: toggleAppearPassword,
                        validator: (password) {
                          if (password.isEmpty)
                            return "Please Enter Password";
                          else if (password.length < 6)
                            return "Password Very Short";
                          return null;
                        },
                      ),
                      RaisedButton(
                          color: Colors.pinkAccent,
                          onPressed: () {
                            saved();
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ForgetPassword.routeName);
                              },
                              child: Text(
                                'Forget Password',
                                style: KStyle,
                              )),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(SignUp.routeName);
                              },
                              child: Text(
                                'Sign Up',
                                style: KStyle,
                              ))
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
