import 'package:flutter/material.dart';

class SettingList {
  String title;
  IconData icon;
  VoidCallback onTap;

  SettingList({required this.title, required this.icon, required this.onTap});
}

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final List<SettingList> _settingList = [
    SettingList(title: "Setting", icon: Icons.settings, onTap: () {}),
    SettingList(title: "Help", icon: Icons.help, onTap: () {}),
    SettingList(title: "About", icon: Icons.info, onTap: () {}),
    SettingList(
        title: "Logout",
        icon: Icons.logout,
        onTap: () {
          // getIt<SharedPreferenceHelper>().removeAuthToken();
          // getIt<UserProvider>().resetData();
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _settingList.map((e) {
        return Card(
          child: ListTile(
              title: Text(e.title), leading: Icon(e.icon), onTap: e.onTap),
        );
      }).toList(),
    );
  }
}
