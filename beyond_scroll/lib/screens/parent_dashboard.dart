import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({super.key});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kids = context.watch<AppState>().kids;

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Good morning, Parent 👋', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                            SizedBox(height: 4),
                            Text('FML_9832_BS', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFFC8EFE0), Color(0xFFA0DEC5)]),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.accent2.withValues(alpha: 0.25),
                                offset: const Offset(0, 4),
                                blurRadius: 12,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Text('PR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF1E6B47))),
                        )
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: AppTheme.clayCardDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('TOTAL SCREEN TIME TODAY', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              const Text('3HR 37MIN', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                              const SizedBox(height: 4),
                              const Text('↑ 12% vs yesterday', style: TextStyle(fontSize: 10, color: AppTheme.warn)),
                            ],
                          ),
                          const Text('VIEW ANALYTICS →', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.accent2)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Text('MANAGE PROFILES', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ...kids.map((kid) => _buildKidCard(kid.name, kid.role, kid.initials)),
                    
                    const SizedBox(height: 24),
                    const Text('UNBLOCK REQUESTS', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: AppTheme.clayCardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('APP LIMIT OVERRIDE', style: TextStyle(fontSize: 9, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                              Text('18:16', style: TextStyle(fontSize: 10, color: AppTheme.inkDim)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text('Aryan Khanna · Instagram Reels', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                          const SizedBox(height: 6),
                          const Text('"Need to check class updates before tuition."', style: TextStyle(fontSize: 11, color: AppTheme.inkDim)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: AppTheme.warnButtonDecoration,
                                  alignment: Alignment.center,
                                  child: const Text('DECLINE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: AppTheme.solidButtonDecoration,
                                  alignment: Alignment.center,
                                  child: const Text('GRANT +10 MIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
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

  Widget _buildKidCard(String name, String role, String initials) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: AppTheme.clayCardDecoration,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFDCFCE7), Color(0xFFBBF7D0)]),
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: Text(initials, style: const TextStyle(fontWeight: FontWeight.w900, color: AppTheme.acidDim, fontSize: 16)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: role == 'Child' ? const Color(0xFFFFE0D0) : const Color(0xFFEAF3EE),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(role.toUpperCase(), style: TextStyle(fontSize: 9, letterSpacing: 0.8, color: role == 'Child' ? AppTheme.warnDim : AppTheme.inkDim, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text('Tap to view analytics & limits', style: TextStyle(color: AppTheme.inkDim, fontSize: 11)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
