import 'package:flutter/material.dart';
import '../theme.dart';

class GrowthLab extends StatelessWidget {
  final String type; // 'family' or 'individual'

  const GrowthLab({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final title = type == 'family' ? 'FAMILY GROWTH' : 'YOUR GROWTH';
    final treeName = type == 'family' ? 'Mighty Oak' : 'Growing Sapling';
    
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.clayCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
              const Text('Level 4', style: TextStyle(color: AppTheme.inkDim, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.park_rounded, color: AppTheme.accent3, size: 56), // Placeholder for tree SVG
                  const SizedBox(height: 12),
                  Text(treeName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.ink)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('14', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[600])),
                    const Text('DAY STREAK', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('3.5h', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.acid)),
                    const Text('AVG OFFLINE', style: TextStyle(fontSize: 10, letterSpacing: 1.4, color: AppTheme.inkDim, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
