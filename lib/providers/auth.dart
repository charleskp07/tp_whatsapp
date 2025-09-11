import 'package:flutter/material.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/services/auth.api.dart';

class AuthProvider with ChangeNotifier {
  final AuthApiService  _apiService = AuthApiService();


  Future<int> login(UserModel user) async {
   
    return await _apiService.login(user);

  }
}