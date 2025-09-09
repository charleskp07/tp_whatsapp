import 'package:dio/dio.dart';
import 'package:whatsapp/models/contact.dart';

class ContactApiService {

  final Dio _dio = Dio(BaseOptions(
    
    baseUrl: 'http://127.0.0.1:8000/api',
    headers: {
      'Content-Type': 'application/json',
      // 'Autorization': 'Bearer $token'
    }
  ));

  // get Contacts : READ
  Future<List<ContactModel>> getContacts() async {
    try {
      final response = await _dio.get('/contacts');
      print(response);
      return (response.data as List)
          .map((contact) => ContactModel.fromJson(contact))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addContact(ContactModel contact) async {
    try {
      await _dio.post('/contacts', data: contact.toJson());
    } catch (e) {
      //error
    }
  }


}