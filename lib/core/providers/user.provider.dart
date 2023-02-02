import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pss_mobile/core/api/auth.api.dart';
import 'package:pss_mobile/core/models/User/user.dart';

const defaultUser = User(
  id: "",
  name: "",
  username: "",
  email: "",
  createAt: "",
  updateAt: "",
);

class UserProvider extends GetxController {
  final AuthApi _authApi = Get.find();
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var googleAuth = Rx<GoogleSignInAuthentication?>(null);
  User currentUser = defaultUser;

  RxBool isLogin = false.obs;

  get accessToken => googleAuth.value?.accessToken;

  set setIsLogin(bool isLogin) {
    this.isLogin.value = isLogin;
  }

  void resetData() {
    currentUser = defaultUser;
    isLogin.value = false;
  }

  login() async {
    var googleAccountResponse = await _googleSignIn.signIn();
    print("login google");
    if (googleAccountResponse == null) {
      Get.snackbar("Error", "Something wrong happens, please try again later!",
          backgroundColor: Colors.green, colorText: Colors.white);
      throw Exception('Google Sign In Failed');
    }

    googleAccount.value = googleAccountResponse;
    googleAuth.value = await googleAccountResponse.authentication;

    setIsLogin = true;
  }

  Future<User?> getCurrentUser() async {
    var res = await _authApi.getCurrentUser();

    if (res == null) throw Exception('Get Current User Failed');

    var resUser = json.decode(res.toString());
    var newUser = User.fromJson(resUser);

    currentUser = newUser;
    isLogin.value = true;
    return newUser;
  }
}
