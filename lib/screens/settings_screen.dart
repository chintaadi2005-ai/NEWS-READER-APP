import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import '../widgets/toggle_title.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback onBack;
  const SettingsScreen({super.key, required this.onBack});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: widget.onBack, icon: const Icon(Icons.arrow_back)),
            const SizedBox(width: 8),
            Text('Settings', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(height: 8),
        Consumer<ThemeService>(
          builder: (context, themeService, child) {
            return ToggleTile(
              title: 'Dark Mode',
              value: themeService.isDarkMode,
              onChanged: (v) => themeService.toggleTheme(),
            );
          },
        ),
        ToggleTile(
            title: 'Notifications',
            value: notifications,
            onChanged: (v) => setState(() => notifications = v)),
        ListTile(
          title: const Text('Language'),
          subtitle: Text(language),
          onTap: () async {
            final languages = ['English', 'Hindi', 'Spanish'];
            final sel = await showDialog<String>(
              context: context,
              builder: (_) => SimpleDialog(
                title: const Text('Select language'),
                children: languages
                    .map((l) => SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, l),
                        child: Text(l)))
                    .toList(),
              ),
            );
            if (sel != null) setState(() => language = sel);
          },
        ),
        const Divider(),
        ListTile(title: const Text('Privacy Policy'), onTap: () {}),
        ListTile(title: const Text('Terms of Service'), onTap: () {}),
      ],
    );
  }
}
