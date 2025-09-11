import 'package:dio/dio.dart';
import 'package:whatsapp/models/user.dart';

class AuthApiService {
  String token = 'myToken';

  final Dio _dio = Dio(BaseOptions(
    
    baseUrl: 'http://127.0.0.1:8000/api',
    headers: {
      'Content-Type': 'application/json',
      // 'Autorization': 'Bearer $token'
    }
  ));


  Future<int> login(UserModel user) async {
    try {
      final response = await _dio.post('/login', data: user.toJson());

      if (response.statusCode == 200) return 1;
      return -1;
    } catch (e) {
      print("Erreur de connexion $e");
      return -1;
    }
  }

    
  

  
}