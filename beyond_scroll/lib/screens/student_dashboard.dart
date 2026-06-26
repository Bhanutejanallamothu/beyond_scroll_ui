import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart';
import '../components/growth_lab.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('STUDENT FOCUS', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                        Text('9:41', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.inkDim)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.ink),
                        children: [
                          TextSpan(text: 'Deep Work '),
                          TextSpan(text: 'Workspace', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.inkDim)),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: AppTheme.clayCardDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('TODAY\'S FOCUS QUOTA', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppTheme.accent2),
                                  children: [
                                    TextSpan(text: '120'),
                                    TextSpan(text: ' MIN LEFT', style: TextStyle(fontSize: 13, color: AppTheme.inkDim)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Text('Spent: 45 mins\nDaily grant: 165 mins', textAlign: TextAlign.right, style: TextStyle(fontSize: 11, color: AppTheme.inkDim)),
                        ],
                      ),
                    ),

                    const GrowthLab(type: 'individual'), // Student only sees individual tree

                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: AppTheme.clayCardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('MANAGE SHIELDS', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          const Text('App Limits & Redirects', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                          const SizedBox(height: 6),
                          const Text('Map distracting apps to productive ones. No passcode required.', style: TextStyle(fontSize: 11, color: AppTheme.inkDim)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 11),
                                  decoration: AppTheme.solidButtonDecoration,
                                  alignment: Alignment.center,
                                  child: const Text('EDIT LIMITS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ],
        ),
      ),
    );
  }
}
