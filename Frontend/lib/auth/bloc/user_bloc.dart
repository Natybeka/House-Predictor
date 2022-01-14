import 'package:skill_learn_client/auth/models/user.dart';
import 'package:skill_learn_client/auth/repository/user-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class AuthenticationBloc extends Bloc<UserEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}) : super(NormalState());

  @override
  Stream<AuthenticationState> mapEventToState(UserEvent event) async* {
    if (event is UserSignUp) {
      bool userSignedUp = await userRepository.signup(event.user);
      if (userSignedUp) {
        yield SignupSuccess(event.currentContext);
      } else {
        yield SignupFailure(event.currentContext);
      }
    } else if (event is UserLogin) {
      User loggedInUser = await userRepository.login(event.user);
      print("event login triggerd");
      if (loggedInUser.accessToken != null) {
        yield LoginSuccess(event.currentContext);
      } else {
        yield LoginFailure(event.currentContext);
      }
    } else {
      yield NormalState();
    }
  }
}
