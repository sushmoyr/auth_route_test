import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome screen"),
            ElevatedButton(
              onPressed: () {
                Routemaster.of(context).push('/auth');
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
