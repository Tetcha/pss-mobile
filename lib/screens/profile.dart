import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_mobile/core/api/user.api.dart';
import 'package:pss_mobile/core/form/radio.dart';
import 'package:pss_mobile/core/form/text_field.dart';
import 'package:pss_mobile/core/form/text_only.dart';
import 'package:pss_mobile/core/providers/sharePreference.provider.dart';
import 'package:pss_mobile/core/providers/user.provider.dart';
import 'package:pss_mobile/interface/form/radio/radio_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProvider _userProvider = Get.find();
  final UserApi _userApi = Get.find();
  final SharedPreferenceProvider _preferenceProvider = Get.find();
  late TextEditingController _studentCodeController;
  late TextEditingController _phoneController;
  late TextEditingController _birthdayController;
  String? _genderValue;

  @override
  void initState() {
    // TODO: implement initState

    _studentCodeController =
        TextEditingController(text: _userProvider.currentUser.name);
    _phoneController =
        TextEditingController(text: _userProvider.currentUser.name);
    _birthdayController =
        TextEditingController(text: _userProvider.currentUser.name);
  }

  void _onClear() {
    _studentCodeController.text = _userProvider.currentUser.name;
  }

  void _onSubmit() async {}

  void onGenderChange(String? value) {
    _genderValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(_userProvider
                      .googleAccount.value?.photoUrl ??
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg"),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            TextOnly(
              label: "Email",
              value: _userProvider.googleAccount.value?.email ?? "Unknown",
            ),
            const SizedBox(height: 10),
            TextOnly(
              label: "Name",
              value:
                  _userProvider.googleAccount.value?.displayName ?? "Unknown",
            ),
            const SizedBox(height: 10),
            TextFieldC(
              controller: _studentCodeController,
              label: "Student Code",
              name: "studentCode",
            ),
            const SizedBox(height: 10),
            TextFieldC(
              controller: _phoneController,
              label: "Phone",
              name: "phone",
            ),
            const SizedBox(height: 10),
            RadioC(
              label: 'Gender',
              options: [
                RadioData(label: "Male", value: 'MALE'),
                RadioData(label: "Female", value: 'FEMALE'),
              ],
              onInputChange: onGenderChange,
            ),
            const SizedBox(height: 10),
            TextFieldC(
              controller: _birthdayController,
              label: "Birthday",
              name: "birthday",
              keyBoardType: TextInputType.datetime,
              context: context,
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
