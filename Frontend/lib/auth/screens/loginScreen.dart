import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/bloc/blocs.dart';
import 'package:skill_learn_client/auth/models/user.dart';
import 'package:skill_learn_client/auth/screens/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_learn_client/RouteGenerator.dart';

import 'components/constants.dart';

class Login extends StatefulWidget {
  String? errorMessage;
  Login(this.errorMessage);
  @override
  _LoginState createState() => _LoginState(this.errorMessage);
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  _LoginState(this.errorMessage);
  final Map<String, dynamic> _user = {};
  var password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/signin_solid.svg",
                  height: size.height * 0.15,
                ),
                Text(
                  "${this.errorMessage != null ? this.errorMessage : ''}",
                  style: TextStyle(color: Colors.red.shade300, fontSize: 18.0),
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "username",
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter username!';
                      }
                      return null;
                    },
                    initialValue: '',
                    onSaved: (value) {
                      setState(() {
                        this._user["username"] = value;
                      });
                    },
                  ),
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();

                      final UserEvent event = UserLogin(
                          User(
                            username: this._user["username"],
                            password: this.password,
                          ),
                          context);

                      BlocProvider.of<AuthenticationBloc>(context).add(event);

                      // Navigator.pushNamedAndRemoveUntil(context,
                      //     RouteGenerator.loginPage, (route) => false);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.restorablePushNamedAndRemoveUntil(
                        context, RouteGenerator.signupPage, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
