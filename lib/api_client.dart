import 'dart:convert';
import 'dart:io';

import 'package:http/post.dart';

class Client {
  final client = HttpClient();

  Future<List<Post>> getPost() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    HttpClientRequest request = await client.getUrl(url);
    HttpClientResponse response = await request.close();
    final data = await response.transform(utf8.decoder).join();
    final jsonData = jsonDecode(data) as List<dynamic>;
    print(jsonData);
    final posts = jsonData.map((e) {
      return Post.fromJson(e as Map<String, dynamic>);
    }).toList();
    return posts;
  }
}
