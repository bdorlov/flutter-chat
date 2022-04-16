import 'package:chat1/screens/auth/recovery.dart';

import './sign_in.dart';
import './sign_up.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    int selectedPage = 0;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        title: const Text(
          'Authorization',
        ),
        centerTitle: true,
        flexibleSpace: const DecoratedBox(
            child: SizedBox(width: double.infinity, height: double.infinity),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.yellowAccent, Colors.blueGrey],
            ))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            changePage(int i) {
              setState(() => selectedPage = i);
              pageController.animateToPage(i,
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.bounceInOut);
            }

            TextStyle textStyle = const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 63, 20, 136),
            );

            TextStyle selectedTextStyle = const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 16, 196, 112),
            );

            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style:
                            selectedPage == 0 ? selectedTextStyle : textStyle,
                      ),
                      onPressed: () => changePage(0)),
                  TextButton(
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style:
                            selectedPage == 1 ? selectedTextStyle : textStyle,
                      ),
                      onPressed: () => changePage(1)),
                  TextButton(
                      child: Text(
                        'Recovery',
                        textAlign: TextAlign.center,
                        style:
                            selectedPage == 2 ? selectedTextStyle : textStyle,
                      ),
                      onPressed: () => changePage(2)),
                ]);
          }),
          Expanded(
            child: PageView(controller: pageController, children: [
              SignInPage(),
              SignUpPage(),
              RecoveryPage(),
            ]),
          ),
        ],
      ),
    );
  }
}
