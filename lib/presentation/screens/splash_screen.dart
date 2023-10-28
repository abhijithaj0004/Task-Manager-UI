import 'package:flutter/material.dart';
import 'package:taskmanager/presentation/screens/authentication/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    gotoAuth(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                opacity: 200,
                fit: BoxFit.cover)),
      ),
    );
  }

  gotoAuth(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Auth(),
        ),
        (route) => false);
  }
}
