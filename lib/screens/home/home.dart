import 'package:chat1/screens/home/about.dart';
import 'package:chat1/screens/home/chat.dart';
import 'package:chat1/screens/home/profile.dart';
import 'package:chat1/screens/home/rooms.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  int pageIndex;

  HomeScreen({Key? key, this.pageIndex = 0}) : super(key: key);
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pageItems = [
    ProfilePage(),
    RoomsPage(),
    ChatPage(),
    AboutPage(),
  ];

  final List<String> pageNames = ['Profile', 'Rooms', 'Chat', 'About'];

  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(pageNames[currentPageIndex]),
          titleTextStyle: const TextStyle(
            fontSize: 24,
          ),
          centerTitle: true,
          flexibleSpace: DecoratedBox(
            child:
                const SizedBox(width: double.infinity, height: double.infinity),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.pink.shade300])),
          )),
      body: IndexedStack(children: pageItems, index: currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          iconSize: 30,
          backgroundColor: Colors.red.shade600,
          unselectedItemColor: Colors.white54,
          selectedItemColor: Colors.white,
          selectedFontSize: 16,
          unselectedFontSize: 13,
          onTap: (index) => setState(() => currentPageIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Rooms',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Chat',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
                backgroundColor: Colors.red),
          ]),
    );
  }
}
