
import 'package:flutter/material.dart';
import 'package:whatsapp/models/contact.dart';
import 'package:whatsapp/services/apiContact.dart';

class ContactProvider with ChangeNotifier {
  final ContactApiService _contactApiService = ContactApiService();
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

  Future<void> fetContacts() async {
    _contacts = await _contactApiService.getContacts();  
    notifyListeners();
  }

  Future<void> addContact(ContactModel contact) async {
    await _contactApiService.addContact(contact);
    notifyListeners();
  }

}