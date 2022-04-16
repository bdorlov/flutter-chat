import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import './screens/auth/auth.dart';
import './screens/home/home.dart';

import './screens/intro.dart';
// import './screens/home/rooms.dart';
// import './screens/home/chat.dart';
// import 'screens/home/profile.dart';
// import 'screens/home/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/intro',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/intro':
            return PageTransition(
                child: IntroScreen(),
                type: PageTransitionType.scale,
                alignment: Alignment.center);
          case '/intro/auth':
            return PageTransition(
                child: AuthScreen(), type: PageTransitionType.fade);
          case '/':
            return PageTransition(
                child: HomeScreen(),
                type: PageTransitionType.rotate,
                alignment: Alignment.center);
          case '/profile':
            return PageTransition(
                child: HomeScreen(pageIndex: 0),
                type: PageTransitionType.rotate,
                alignment: Alignment.center);
          case '/rooms':
            return PageTransition(
                child: HomeScreen(pageIndex: 1),
                type: PageTransitionType.rotate,
                alignment: Alignment.center);
          case '/chat':
            return PageTransition(
                child: HomeScreen(pageIndex: 2),
                type: PageTransitionType.rotate,
                alignment: Alignment.center);
          case '/about':
            return PageTransition(
                child: HomeScreen(pageIndex: 3),
                type: PageTransitionType.rotate,
                alignment: Alignment.center);
        }
      },
      // routes: {
      //   '/': (context) => IntroScreen(),
      //   '/home': ((context) => HomeScreen()),
      //   '/profile': ((context) => HomeScreen(pageIndex: 0)),
      //   '/rooms': ((context) => HomeScreen(pageIndex: 1)),
      //   '/chat': ((context) => HomeScreen(pageIndex: 2)),
      //   '/about': ((context) => HomeScreen(pageIndex: 3)),
      // },
    );
  }
}
