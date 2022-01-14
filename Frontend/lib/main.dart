import 'package:flutter/material.dart';
import 'package:skill_learn_client/auth/bloc/blocs.dart';
import 'package:skill_learn_client/content/bloc_observer.dart';
// import 'package:skill_learn_client/content/screens/components/home_top_image.dart';
// import 'package:skill_learn_client/content/screens/components/video_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'content/bloc_observer.dart';

import 'RouteGenerator.dart';

import 'package:skill_learn_client/auth/repository/user-repository.dart';
import 'package:skill_learn_client/auth/data_provider/user-data-provider.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  // initialize top level user repository
  final UserRepository userRepository = UserRepository(UserDataProvider());

  runApp(MyApp(userRepository: userRepository));
}

// class Articles extends StatelessWidget {
//   final SkillLearnHome widget;

//   const Articles({required this.widget});

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: this.widget.articleRepository,
//       child: BlocProvider(
//         create: (context) =>
//             ArticleBloc(articleRepository: this.widget.articleRepository)
//               ..add(ArticleLoad()),
//         child: ArticleList(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  MyApp({required this.userRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.userRepository,
      child: BlocProvider(
        create: (context) =>
            AuthenticationBloc(userRepository: this.userRepository),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: RouteGenerator.welcomePage,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
