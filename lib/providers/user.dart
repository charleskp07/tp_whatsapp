import 'package:flutter/material.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/services/api.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  Future<void> fetchUsers() async {
    _users = await _apiService.getUsers();
    notifyListeners(); // Ecouteurs d'events pournotificier lors d'un changement 
  }

  Future<void> addUser(UserModel user) async {
    await _apiService.addUser(user);
    notifyListeners();
  }
}