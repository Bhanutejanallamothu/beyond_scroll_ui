import 'package:flutter/material.dart';

class KidProfile {
  final String id;
  final String name;
  final String role; // 'Child' or 'Student'
  final String initials;
  final int age;

  KidProfile({
    required this.id,
    required this.name,
    required this.role,
    required this.initials,
    required this.age,
  });
}

class AppState extends ChangeNotifier {
  bool _hasOnboarded = false;
  String? _currentRole;
  List<KidProfile> _kids = [];
  final String _passcode = '1612'; // Mock passcode

  bool get hasOnboarded => _hasOnboarded;
  String? get currentRole => _currentRole;
  List<KidProfile> get kids => _kids;
  String get passcode => _passcode;

  void completeOnboarding(String parentName) {
    _hasOnboarded = true;
    // Mock initial kids setup
    _kids = [
      KidProfile(id: '1', name: 'Sunita', role: 'Student', initials: 'SU', age: 16),
      KidProfile(id: '2', name: 'Vihaan', role: 'Child', initials: 'VI', age: 10),
    ];
    notifyListeners();
  }

  void setRole(String role) {
    _currentRole = role;
    notifyListeners();
  }

  void logout() {
    _currentRole = null;
    notifyListeners();
  }
}
