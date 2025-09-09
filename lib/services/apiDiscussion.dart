import 'package:dio/dio.dart';
import 'package:whatsapp/models/discussion.dart';

class DiscussionApiService {
  final Dio _dio = Dio(BaseOptions(
    
    baseUrl: 'http://127.0.0.1:8000/api',
    headers: {
      'Content-Type': 'application/json',
      // 'Autorization': 'Bearer $token'
    }
  ));

  Future<List<DiscussionModel>> getDiscussions() async {
    try {
      final response = await _dio.get('/discussions');
      print(response);
      return (response.data as List)
          .map((discussion) => DiscussionModel.fromJson(discussion))
          .toList();
    } catch (e) {
      return[];
    }
  }


  Future<void> addDiscussion(DiscussionModel discussion) async {
    try {
      await _dio.post('/discussions', data: discussion.toJson());
    } catch (e) {
      //error
    }
  }


}