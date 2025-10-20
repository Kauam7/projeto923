import 'package:projeto_923/pages/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto_923/pages/QuizIntroScreen.dart';
import 'package:projeto_923/screens/profile_detail_screen.dart';
import 'package:projeto_923/screens/profile_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  var pages = [
    ProfileListScreen(),
    QuizIntroScreen()
    //ProfileDetailScreen(profile: profile)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
          ],
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xFF6C6C6C),
      selectedItemColor: Color(0xFFE41D56),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explorer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Notícias',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.question),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circleUser),
            label: 'Profile'
        ),
      ],
    );
  }
}