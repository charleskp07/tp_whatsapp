import 'package:flutter/material.dart';
import 'package:whatsapp/models/discussion.dart';
import 'package:whatsapp/services/apiDiscussion.dart';

class DiscussionProvider with ChangeNotifier {
  final DiscussionApiService _discussionApiService = DiscussionApiService();
  List<DiscussionModel> _discussions = [];

  List<DiscussionModel> get discussions => _discussions;

  Future<void> fetDiscussions() async {
    _discussions = await _discussionApiService.getDiscussions();
    notifyListeners();
  }

  Future<void> addDiscussion(DiscussionModel discussion) async {
    await _discussionApiService.addDiscussion(discussion);
    notifyListeners();
  }
}