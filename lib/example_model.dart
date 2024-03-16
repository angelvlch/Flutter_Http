import 'package:flutter/material.dart';
import 'package:https/post.dart';

class ExampleWidgetModel extends ChangeNotifier {
  var _post = <Post>[];
  List<Post> get posts => _post;
}
