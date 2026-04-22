import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/features/auth/data/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();

  final auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome Back", style: TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: pass,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await auth.login(email.text, pass.text);
                context.go('/home');
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () => context.go('/register'),
              child: const Text("Create account"),
            ),
          ],
        ),
      ),
    );
  }
}
