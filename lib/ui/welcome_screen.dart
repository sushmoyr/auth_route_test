import 'dart:ui';

import 'package:auth_route_test/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routemaster/routemaster.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displayMedium?.copyWith(
          color: Colors.white,
        );
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Image.asset(
              Assets.assetsBackground,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text.rich(
              const TextSpan(
                children: [
                  TextSpan(text: 'Welcome to\n'),
                  TextSpan(text: 'The Heavenly Palace'),
                ],
              ),
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 32,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text("Login"),
                ),
                SizedBox(width: 24),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text("Sign up"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
