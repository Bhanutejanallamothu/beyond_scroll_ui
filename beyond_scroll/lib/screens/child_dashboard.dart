import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart';
import '../components/growth_lab.dart';

class ChildDashboard extends StatefulWidget {
  const ChildDashboard({super.key});

  @override
  State<ChildDashboard> createState() => _ChildDashboardState();
}

class _ChildDashboardState extends State<ChildDashboard> {
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
                        Text('MIVA', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                        Text('9:41', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.inkDim)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.ink),
                        children: [
                          TextSpan(text: 'Fresh Seed '),
                          TextSpan(text: 'still growing', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.inkDim)),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: AppTheme.clayCardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('MOTIVATION SNAPSHOT', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE4D0),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: const Icon(Icons.local_fire_department_rounded, color: AppTheme.warnDim, size: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text('1 day streak · 0 badges earned', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                          const SizedBox(height: 4),
                          const Text('Just joined the BeyondScroll family space.', style: TextStyle(fontSize: 11, color: AppTheme.inkDim)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(child: _buildStatCard('0', 'MIN SAVED')),
                        const SizedBox(width: 10),
                        Expanded(child: _buildStatCard('45%', 'TREE HEALTH', color: AppTheme.accent2)),
                        const SizedBox(width: 10),
                        Expanded(child: _buildStatCard('0', 'FAMILY MIN')),
                      ],
                    ),
                    
                    const SizedBox(height: 14),
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
                                    TextSpan(text: '30'),
                                    TextSpan(text: ' MIN LEFT', style: TextStyle(fontSize: 13, color: AppTheme.inkDim)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Text('Spent: 0 mins\nDaily grant: 30 mins', textAlign: TextAlign.right, style: TextStyle(fontSize: 11, color: AppTheme.inkDim)),
                        ],
                      ),
                    ),

                    const GrowthLab(type: 'family'),
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

  Widget _buildStatCard(String value, String label, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AppTheme.clayCardDecoration,
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color ?? AppTheme.ink)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 8, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
