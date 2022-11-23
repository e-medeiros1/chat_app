// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatMessageEntity {
  String text;
  String? imageUrl;
  int timeStamp;
  String id;
  Author author;

  ChatMessageEntity({
    required this.text,
    this.imageUrl,
    required this.timeStamp,
    required this.id,
    required this.author,
  });
}

class Author {
  String username;

  Author({
    required this.username,
  });
}
