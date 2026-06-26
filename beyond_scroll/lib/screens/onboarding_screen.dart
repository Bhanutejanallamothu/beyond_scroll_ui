import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _nameController = TextEditingController();

  void _handleOnboard() {
    if (_nameController.text.isNotEmpty) {
      context.read<AppState>().completeOnboarding(_nameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppTheme.ink),
                  children: [
                    TextSpan(text: 'BEYOND'),
                    TextSpan(text: 'SCROLL', style: TextStyle(color: AppTheme.acid)),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text('WELCOME', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Let\'s set up your family space', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.ink)),
              
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: AppTheme.clayCardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('YOUR NAME', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'e.g. Meera',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _handleOnboard,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: AppTheme.solidButtonDecoration,
                  alignment: Alignment.center,
                  child: const Text('CONTINUE ›', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
