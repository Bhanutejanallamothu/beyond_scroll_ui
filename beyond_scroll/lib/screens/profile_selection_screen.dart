import 'package:flutter/material.dart';
// removed unused imports
import '../theme.dart';
import 'auth_screen.dart';

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String _selectedRole = 'Child'; // Default selection based on image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppTheme.ink),
                  children: [
                    TextSpan(text: 'BEYOND'),
                    TextSpan(text: 'SCROLL', style: TextStyle(color: AppTheme.acid)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('ACCESS POINT', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Who is logging in today?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.ink)),
              const SizedBox(height: 8),
              const Text('Select a profile role below to enter your workspace.', style: TextStyle(fontSize: 12, color: AppTheme.inkDim)),
              
              const SizedBox(height: 24),
              _buildProfileCard('Parent', 'PARENT ACCOUNT', 'FAMILY', 'Family controls & limits', AppTheme.acidDim, const Color(0xFFD4F0E4)),
              const SizedBox(height: 14),
              _buildProfileCard('Child', 'CHILD PROFILE', 'RESTRICTED', 'Protected offline learning', AppTheme.warnDim, const Color(0xFFFFE0D0)),
              const SizedBox(height: 14),
              _buildProfileCard('Student', 'STUDENT PROFILE', 'SOLO', 'Standalone focus workspace', AppTheme.inkDim, const Color(0xFFEAF3EE)),
              
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(role: _selectedRole),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: AppTheme.solidButtonDecoration,
                  alignment: Alignment.center,
                  child: Text('CONTINUE TO ${_selectedRole.toUpperCase()} ›', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(String role, String title, String pillText, String subtitle, Color pillTextColor, Color pillBg) {
    final isSelected = _selectedRole == role;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedRole = role),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? AppTheme.acid.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.5), 
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.acid.withValues(alpha: isSelected ? 0.2 : 0.1),
              offset: const Offset(0, 8),
              blurRadius: 24,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: pillBg,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(pillText, style: TextStyle(fontSize: 9, letterSpacing: 0.8, color: pillTextColor, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(subtitle, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppTheme.ink)),
          ],
        ),
      ),
    );
  }
}
