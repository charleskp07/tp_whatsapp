import 'package:dio/dio.dart';
import 'package:whatsapp/models/user.dart';

class ApiService {
  String token = 'myToken';

  final Dio _dio = Dio(BaseOptions(
    
    baseUrl: 'http://127.0.0.1:8000/api',
    headers: {
      'Content-Type': 'application/json',
      // 'Autorization': 'Bearer $token'
    }
  ));

  // get Users : READ
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      print(response);
      return (response.data as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (e) {
      return [];
    }
  }

  // Add a new User
  Future<void> addUser(UserModel user) async {
    try {
      await _dio.post('/users', data: user.toJson());
    } catch (e) {
      // Error :
    }
  }

  
}