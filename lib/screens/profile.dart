import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_mobile/core/api/user.api.dart';
import 'package:pss_mobile/core/form/TextField.dart';
import 'package:pss_mobile/core/form/TextOnly.dart';
import 'package:pss_mobile/core/providers/user.provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProvider _userProvider = Get.find();
  final UserApi _userApi = Get.find();

  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    // TODO: implement initState
    _usernameController =
        TextEditingController(text: _userProvider.currentUser.username);
    _emailController =
        TextEditingController(text: _userProvider.googleAccount?.value.email);
    _nameController =
        TextEditingController(text: _userProvider.currentUser.name);
    super.initState();
  }

  void _onClear() {
    _usernameController.text = _userProvider.currentUser.username;
    _emailController.text = _userProvider.currentUser.email;
    _nameController.text = _userProvider.currentUser.name;
  }

  void _onSubmit() async {
    var res = await _userApi.updateUser(
        username: _usernameController.text,
        email: _emailController.text,
        name: _nameController.text);

    if (res?.statusCode == 200) {
      _userProvider.getCurrentUser();
      //TODO : send notification
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg"),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFieldC(
              controller: _usernameController,
              label: "Username",
              name: "username",
            ),
            const SizedBox(height: 10),
            const TextOnly(
              label: "Email",
              value: "dauleduc2@gmail.com",
            ),
            const SizedBox(height: 10),
            TextFieldC(
              controller: _nameController,
              label: "Name",
              name: "name",
            ),
            const SizedBox(height: 30),
            // bottom control button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _onClear,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).errorColor,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  ),
                  child: const Text("Clear"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  ),
                  child: const Text("Save"),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
