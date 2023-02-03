import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_mobile/core/providers/sharePreference.provider.dart';

class SettingList {
  String title;
  IconData icon;
  VoidCallback onTap;

  SettingList({required this.title, required this.icon, required this.onTap});
}

class SettingScreen extends StatelessWidget {
  late final SharedPreferenceProvider _preferenceProvider;

  SettingScreen({super.key}) : _preferenceProvider = Get.find();

  final List<SettingList> _settingList = [
    SettingList(title: "Setting", icon: Icons.settings, onTap: () {}),
    SettingList(title: "Help", icon: Icons.help, onTap: () {}),
    SettingList(title: "About", icon: Icons.info, onTap: () {}),
    SettingList(
        title: "Logout",
        icon: Icons.logout,
        onTap: () {
          _preferenceProvider.removeAuthToken();
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
