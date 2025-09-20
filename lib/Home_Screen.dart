import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  final String password;

  const HomeScreen({required this.email, required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email: $email"),
            const SizedBox(height: 10),
            Text("Password: $password"),
          ],
        ),
      ),
    );
  }
}
