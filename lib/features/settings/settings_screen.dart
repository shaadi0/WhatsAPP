import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
            ),
            title: const Text('Your Name'),
            subtitle: const Text('+9477222222'),
            trailing: Icon(
              Icons.qr_code,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Divider(),
          _buildSettingsItem(Icons.key, 'Account'),
          _buildSettingsItem(Icons.lock, 'Privacy'),
          _buildSettingsItem(Icons.chat, 'Chats'),
          _buildSettingsItem(Icons.notifications, 'Notifications'),
          _buildSettingsItem(Icons.circle_outlined, 'Storage and data'),
          _buildSettingsItem(Icons.language, 'App language'),
          _buildSettingsItem(Icons.help_outline, 'Help'),
          _buildSettingsItem(Icons.people, 'Invite a friend'),
          const Divider(),
          _buildSettingsItem(Icons.logout, 'Log out', isRed: true),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String text, {bool isRed = false}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : null),
      title: Text(text, style: TextStyle(color: isRed ? Colors.red : null)),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
