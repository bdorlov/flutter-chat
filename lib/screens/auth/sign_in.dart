import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool _isPasswordVisible = false;
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: Colors.blue),
                    fillColor: const Color.fromARGB(255, 189, 178, 201),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 15)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (!(value?.contains('@') ?? true)) {
                    return 'Not valie email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: 'Your E-mail',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
              ),
              const SizedBox(
                height: 20,
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return TextFormField(
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIconConstraints: const BoxConstraints(
                        //minHeight: 32,
                        minWidth: 60,
                      ),
                      suffixIcon: IconButton(
                        color: _isPasswordVisible ? Colors.red : Colors.blue,
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => setState(
                            () => _isPasswordVisible = !_isPasswordVisible),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 80,
              ),
              // TextFormField(
              //     decoration: const InputDecoration(hintText: 'Repeat password')),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // check such username in DB on the server!!!

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('lol'),
                        duration: Duration(
                          milliseconds: 500,
                        ),
                      ));
                    }
                  },
                  child: const Text('Sign In'))
            ],
          ),
        ));
  }
}
