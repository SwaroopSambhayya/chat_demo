import 'package:flutter/material.dart';
import 'chatscreen.dart';
import '../widgets/feeds.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          print(index);
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Color(0xff2B4A63),
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          )
        ],
      ),
      body: currentIndex == 0 ? Feeds() : ChatScreen(),
    );
  }
}
