import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'theme.dart';
import 'screens/onboarding_screen.dart';
import 'screens/profile_selection_screen.dart';
import 'screens/parent_dashboard.dart';
import 'screens/child_dashboard.dart';
import 'screens/student_dashboard.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const BeyondScrollApp(),
    ),
  );
}

class BeyondScrollApp extends StatelessWidget {
  const BeyondScrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeyondScroll',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const AppRouter(),
    );
  }
}

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    if (!state.hasOnboarded) {
      return const OnboardingScreen();
    }

    if (state.currentRole == null) {
      return const ProfileSelectionScreen();
    }

    switch (state.currentRole) {
      case 'Parent':
        return const ParentDashboard();
      case 'Child':
        return const ChildDashboard();
      case 'Student':
        return const StudentDashboard();
      default:
        return const ProfileSelectionScreen();
    }
  }
}
