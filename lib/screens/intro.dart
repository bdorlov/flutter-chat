import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        title: const Text(
          'Chat',
        ),
        centerTitle: true,
        flexibleSpace: const DecoratedBox(
            child: SizedBox(width: double.infinity, height: double.infinity),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.yellowAccent, Colors.blueGrey],
            ))),
      ),
      body: DecoratedBox(
        child: SizedBox(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(flex: 10),
            const Text(
              'Flutter chat',
              style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
            ),
            const Spacer(flex: 2),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/intro/auth', (_) => false);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Start', style: TextStyle()),
                )),
            const Spacer(flex: 10),
          ]),
          width: double.infinity,
          height: double.infinity,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue],
          ),
        ),
      ),
    );
  }
}
