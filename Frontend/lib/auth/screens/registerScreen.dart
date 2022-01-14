import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/bloc/blocs.dart';
import 'package:skill_learn_client/auth/models/user.dart';
import 'package:skill_learn_client/auth/screens/components/components.dart';
import 'components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_learn_client/RouteGenerator.dart';

class Signup extends StatefulWidget {
  String? errorMessage;
  Signup(this.errorMessage);
  @override
  _SignupState createState() => _SignupState(errorMessage);
}

// Sign up page widget
// ignore: must_be_immutable
class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  final Map<String, dynamic> _user = {};
  var password;

  // constructor to check for error messages
  _SignupState(this.errorMessage);
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
                    "SIGNUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/signup_solid.svg",
                    height: size.height * 0.15,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    "${this.errorMessage != null ? this.errorMessage : ''}",
                    style:
                        TextStyle(color: Colors.red.shade300, fontSize: 18.0),
                  ),
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
                  TextFieldContainer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        ),
                        hintText: "email",
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter email!';
                        }
                        return null;
                      },
                      initialValue: '',
                      onSaved: (value) {
                        setState(() {
                          this._user["email"] = value;
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
                    text: "SIGNUP",
                    press: () {
                      final form = _formKey.currentState;
                      if (form != null && form.validate()) {
                        form.save();
                        print(this._user);
                        print(this.password);
                        final UserEvent event = UserSignUp(
                            User(
                              username: this._user["username"],
                              email: this._user["email"],
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
                    login: false,
                    press: () {
                      Navigator.restorablePushNamedAndRemoveUntil(
                          context, RouteGenerator.loginPage, (route) => false);
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
