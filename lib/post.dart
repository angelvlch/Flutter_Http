class Post {
  final userId;
  final id;
  final title;
  final body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  toString() =>
      "POST:\n ${this.id}, ${this.userId}, ${this.title}, ${this.body}";
  factory Post.fromJson(Map<String, dynamic> jsonMap) {
    return Post(
      userId: jsonMap['userId'] as int,
      id: jsonMap['id'] as int,
      title: jsonMap["title"] as String,
      body: jsonMap["body"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
