import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onSettingsClick;
  final VoidCallback onBookmarksClick;
  final VoidCallback onLogout;

  const ProfileScreen({
    super.key,
    required this.onSettingsClick,
    required this.onBookmarksClick,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
          const SizedBox(height: 12),
          Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text('john.doe@example.com',
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('My Bookmarks'),
              onTap: onBookmarksClick),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: onSettingsClick),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: onLogout),
        ],
      ),
    );
  }
}
