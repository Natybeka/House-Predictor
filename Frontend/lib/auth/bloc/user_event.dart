import 'package:flutter/cupertino.dart';
import 'package:skill_learn_client/auth/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  Object? get user => null;

  get buildContext => null;

  get currentContext => null;
}

class UserSignUp extends UserEvent {
  late User user;
  late BuildContext currentContext;

  UserSignUp(User user, BuildContext context) {
    this.user = user;
    this.currentContext = context;
  }

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Signed up {user: $user}';
}

class UserLogin extends UserEvent {
  final User user;
  late BuildContext currentContext;
  UserLogin(this.user, this.currentContext);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Logged in {user: $user}';
}
