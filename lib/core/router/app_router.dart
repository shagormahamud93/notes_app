import 'package:go_router/go_router.dart';
import 'package:notes_app/features/auth/presentation/login_page.dart';
import 'package:notes_app/features/auth/presentation/register_page.dart';
import 'package:notes_app/features/notes/presentation/add_note_page.dart';
import 'package:notes_app/features/notes/presentation/home_page.dart';
import 'package:notes_app/splash_page.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (_, __) => const SplashPage()),
    GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
    GoRoute(path: '/home', builder: (_, __) => const HomePage()),
    GoRoute(path: '/add', builder: (_, __) => const AddNotePage()),
  ],
);
