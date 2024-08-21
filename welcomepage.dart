import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file to navigate to StopAndWorkHome

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const StopAndWorkHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star, // Replace this with the icon you want to use
              size: 100.0, // Set the size of the icon
              color: Colors.blue, // Set the color of the icon
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Welcome to StopAndWork', // Customize the text below the icon
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
