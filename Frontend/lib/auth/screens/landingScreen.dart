import 'package:flutter/material.dart';
import 'package:skill_learn_client/content/repository/article-repository.dart';
import 'package:skill_learn_client/content/screens/home_page.dart';
import 'package:skill_learn_client/user/screens/profile_page.dart';

class LandingScreen extends StatefulWidget {
  final ArticleRepository articleRepository;

  LandingScreen({required this.articleRepository});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;

  final tabs = [
    ListView(
      // mainAxisSize: MainAxisSize.max,
      children: [
        // VideoTile(),
        HomePage(),
        SizedBox(
          height: 30,
        ),
      ],
    ),
    Center(
      child: Text("Second Page"),
    ),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final String message = "Message";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Skill Learn"),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Creators",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          onTap: (index) => {
            setState(() {
              _currentIndex = index;
            })
          },
        ),
      ),
    );
  }
}
