// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wdtc/network/network_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Image(
                image: AssetImage("images/logo.png"),
                height: 60,
              ),
              const SizedBox(height: 56),
              const Text(
                'NFT Access',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please fill your details to access your account',
              ),
              const SizedBox(height: 56),
              const Text(
                'Email',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                  onChanged: (value) => print(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'aexyno@gmail.com',
                  ),
                ),
              ),
              const Text(
                'Password',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) => print(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '*******',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CheckboxListTile(
                  //   title: const Text("Remember Me"),
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //   contentPadding: null,
                  //   value: false,
                  //   onChanged: (value) => print(value),
                  // ),
                  GestureDetector(
                    onTap: () => print("Forgot password"),
                    child: const Text(
                      'Forgot Password?',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print("Sign In");
                  NetworkManager.instance.login();
                },
                child: const Text("Sign In"),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  print("Sign with google");
                  NetworkManager.instance.getUsers();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png"),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text("Sign In with Google"),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account. "),
                  GestureDetector(
                    onTap: () => print("Forgot password"),
                    child: const Text(
                      'Forgot Password?',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
