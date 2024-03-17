/* import 'dart:convert';
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
} */
import 'dart:convert';

import 'package:https/models/post.dart';

import 'package:http/http.dart' as http;

class Client {
  Future<List<Post>> getPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      // почему здесь обязательно указывать тип  List<dynamic> и List<Post> ? (без этого была ошибка)
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Post> data = jsonData.map((e) => Post.fromJson(e)).toList();

      return data;
    } else {
      throw Exception('Failed to load...');
    }
  }
}
