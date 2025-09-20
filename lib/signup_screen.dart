import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showErrorEmail = false;
  bool obscureText = true;
  bool obscureConfirmText = true;

  bool isEmail({required String em}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(p).hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: const Text("Email"),
                hintText: "Enter your email",
                errorText: showErrorEmail ? "Invalid email" : null,
                suffixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: obscureText,
              controller: passwordController,
              decoration: InputDecoration(
                label: const Text("Password"),
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: obscureConfirmText,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                label: const Text("Confirm Password"),
                hintText: "Re-enter your password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureConfirmText = !obscureConfirmText;
                    });
                  },
                  icon: obscureConfirmText
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showErrorEmail = !isEmail(em: emailController.text);
                });

                if (!showErrorEmail &&
                    passwordController.text.isNotEmpty &&
                    passwordController.text == confirmPasswordController.text) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                } else if (passwordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords do not match")),
                  );
                }
              },
              child: const Text("Sign Up."),
            ),
          ],
        ),
      ),
    );
  }
}
