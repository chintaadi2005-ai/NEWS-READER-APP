import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const BottomNav(
      {super.key, required this.activeTab, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'home',
      'categories',
      'bookmarks',
      'notifications',
      'profile'
    ];
    final idx = tabs.indexOf(activeTab);

    return NavigationBar(
      selectedIndex: idx < 0 ? 0 : idx,
      onDestinationSelected: (index) => onTabChange(tabs[index]),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
        NavigationDestination(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
        NavigationDestination(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
