import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_learn_client/auth/screens/auth_screens.dart';
// import 'package:skill_learn_client/content/repository/article-repository.dart';

class RouteGenerator {
  static const String welcomePage = '/';
  static const String signupPage = '/signup';
  static const String loginPage = '/login';
  static const String landingPage = '/landingPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
        break;
      case signupPage:
        return MaterialPageRoute(builder: (_) => Signup(null));
        break;
      case loginPage:
        return MaterialPageRoute(builder: (_) => Login(null));
        break;

      default:
        throw FormatException('Route was not found');
    }
  }
}
