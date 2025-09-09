class DiscussionModel {
  int? id;
  String sender_id;
  String receiver_id;
  String message;

  DiscussionModel({
    this.id,
    required this.sender_id,
    required this.receiver_id,
    required this.message,
  });

  // Convert JSON to Discussion Model
  factory DiscussionModel.fromJson(Map<String, dynamic> json) {
    return DiscussionModel(
      id: json['id'],
      sender_id: json['sender_id'],
      receiver_id: json['receiver_id'],
      message: json['message']
    );
  }


  // Convert Discussion Model to Json
  Map<String,dynamic>toJson() {
    return {
      'id' : id,
      'sender_id' : sender_id,
      'receiver_id' : receiver_id,
      'message' : message,
    };
  }

}