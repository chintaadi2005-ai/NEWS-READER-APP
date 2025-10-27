import 'package:flutter/material.dart';
import '../widgets/toggle_title.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Text('Notifications', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        ToggleTile(
            title: 'Enable Notifications',
            value: enabled,
            onChanged: (v) => setState(() => enabled = v)),
        const Divider(),
        Expanded(
          child: ListView(
            children: List.generate(
                6,
                (i) => ListTile(
                    leading: const Icon(Icons.notification_important),
                    title: Text('Breaking news #${i + 1}'),
                    subtitle: const Text('Sample notification text'))),
          ),
        ),
      ],
    );
  }
}
