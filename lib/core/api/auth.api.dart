import 'dart:convert';

import 'package:get/get.dart';
import 'package:pss_mobile/core/api/config.dart' show ApiClient;

class AuthApi {
  final ApiClient _apiClient = Get.find();

  Future<dynamic> login(String username, String password) async {
    try {
      final response = await _apiClient.http.post('/auth/login',
          data: json.encode({
            'username': username,
            'password': password,
          }));
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> register(
      {required String username,
      required String password,
      required String email,
      required String name,
      required String confirmPassword}) async {
    try {
      final response = await _apiClient.http.post('/auth/register',
          data: json.encode({
            'username': username,
            'password': password,
            'email': email,
            'name': name,
            'confirmPassword': confirmPassword
          }));
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getCurrentUser() async {
    try {
      final response = await _apiClient.http.get('/users/me');
      return response;
    } catch (e) {
      return null;
    }
  }
}
