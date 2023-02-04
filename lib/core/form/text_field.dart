import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pss_mobile/core/constants/style.dart';
import 'package:pss_mobile/core/providers/api.provider.dart';

class TextFieldC extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  final String error;
  final String name;
  final dynamic defaultValue;
  final String hintText;
  final TextInputType keyBoardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final dynamic context;
  final bool disabled;

  const TextFieldC({
    super.key,
    this.controller,
    this.error = '',
    this.label = '',
    this.name = '',
    this.defaultValue = '',
    this.hintText = '',
    this.isPassword = false,
    this.keyBoardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.context,
    this.disabled = false,
  });

  void _presentDatePicker() {
    if (context != null) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }

        controller?.text = DateFormat.yMd().format(pickedDate);
      });
    } else {
      // ignore: avoid_print
      print('context is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiController = Get.find();
    final String error = apiController.errorDetails[name] ?? '';
    return Column(
      children: [
        TextField(
          enabled: !disabled,
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyBoardType == TextInputType.datetime
              ? TextInputType.none
              : keyBoardType,
          onTap: keyBoardType == TextInputType.datetime
              ? _presentDatePicker
              : null,
          decoration: InputDecoration(
            // border: const UnderlineInputBorder(),
            labelText: label,
            labelStyle: TextStyle(
              color: StyleTheme.formTitleColor,
            ),
            hintText: hintText,
            prefixIcon: suffixIcon,
            suffixIcon: keyBoardType == TextInputType.datetime
                ? GestureDetector(
                    onTap: _presentDatePicker,
                    child:
                        prefixIcon ?? const Icon(Icons.calendar_today_rounded),
                  )
                : prefixIcon,
          ),
        ),
        error != '' ? const SizedBox(height: 10) : const SizedBox.shrink(),
        error != ''
            ? Align(
                alignment: Alignment.topLeft,
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
