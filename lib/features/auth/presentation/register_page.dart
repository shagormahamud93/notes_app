import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/utils/app_snackbar.dart';
import 'package:notes_app/features/auth/data/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                try {
                  await auth.register(email.text, pass.text);
                  if (!context.mounted) return;
                  AppSnackBar.show(
                    context,
                    message: "Account created successfully!",
                  );
                  await Future.delayed(const Duration(milliseconds: 500));
                  context.go('/home');
                } catch (e) {
                  AppSnackBar.show(
                    context,
                    message: "Registration failed. Try again.",
                    isError: true,
                  );
                }
              },
              child: const Text("Register"),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text("Already Create account"),
            ),
          ],
        ),
      ),
    );
  }
}
