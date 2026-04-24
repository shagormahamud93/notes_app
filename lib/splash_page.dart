import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.mainGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColors.glass,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.note_alt_rounded,
                  size: 80,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "My Notes",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Organize your thoughts easily",
                style: TextStyle(fontSize: 14, color: AppColors.white70),
              ),
              const SizedBox(height: 30),
              const Text(
                "Organize your thoughts easily",
                style: TextStyle(fontSize: 14, color: AppColors.white70),
              ),
              // Loading indicator
              const CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
