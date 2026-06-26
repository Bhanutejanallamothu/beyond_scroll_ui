import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final role = context.watch<AppState>().currentRole;

    return Container(
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.82),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(44), topRight: Radius.circular(44)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.acid.withValues(alpha: 0.10),
            offset: const Offset(0, -4),
            blurRadius: 20,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab(Icons.home_rounded, 'HOME', 0),
          
          if (role == 'Parent')
            _buildTab(Icons.mail_rounded, 'CABINET', 1),
            
          if (role == 'Child' || role == 'Student')
            _buildTab(Icons.park_rounded, 'GROWTH', 1),
            
          _buildExitTab(context),
        ],
      ),
    );
  }

  Widget _buildTab(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? AppTheme.accent2 : AppTheme.inkDim, size: 28),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 9.5, letterSpacing: 0.3, color: isSelected ? AppTheme.accent2 : AppTheme.inkDim, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildExitTab(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AppState>().logout(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.exit_to_app_rounded, color: AppTheme.inkDim, size: 28),
          const SizedBox(height: 4),
          const Text('EXIT', style: TextStyle(fontSize: 9.5, letterSpacing: 0.3, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
