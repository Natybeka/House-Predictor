import 'package:equatable/equatable.dart';
import 'package:skill_learn_client/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:skill_learn_client/auth/bloc/blocs.dart';
import 'package:skill_learn_client/auth/screens/auth_screens.dart';
import 'package:skill_learn_client/auth/screens/loginScreen.dart';
import 'package:skill_learn_client/auth/screens/registerScreen.dart';
import 'package:skill_learn_client/content/data_provider/article-data-provider.dart';
import 'package:skill_learn_client/content/repository/article-repository.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class NormalState extends AuthenticationState {}

class SignupSuccess extends AuthenticationState {
  late BuildContext currentContext;
  SignupSuccess(BuildContext context) {
    this.currentContext = context;
    Navigator.pushNamedAndRemoveUntil(
        this.currentContext, RouteGenerator.loginPage, (route) => false);
  }
}

class SignupFailure extends AuthenticationState {
  late BuildContext currentContext;
  SignupFailure(BuildContext context) {
    this.currentContext = context;
    Navigator.pushAndRemoveUntil(
        this.currentContext,
        MaterialPageRoute(
            builder: (_) => Signup("Sign up failed. Please try again!")),
        (route) => false);
  }
}

class LoginSuccess extends AuthenticationState {
  late BuildContext currentContext;
  LoginSuccess(BuildContext context) {
    this.currentContext = context;
    Navigator.pushAndRemoveUntil(
        this.currentContext,
        MaterialPageRoute(
            builder: (_) => LandingScreen(
                  articleRepository: ArticleRepository(ArticleDataProvider()),
                )),
        (route) => false);
  }
}

class LoginFailure extends AuthenticationState {
  late BuildContext currentContext;
  LoginFailure(BuildContext context) {
    this.currentContext = context;
    Navigator.pushAndRemoveUntil(
        this.currentContext,
        MaterialPageRoute(
            builder: (_) => Login("Login failed. Please try again!")),
        (route) => false);
  }
}
