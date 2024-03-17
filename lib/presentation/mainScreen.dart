import 'package:flutter/material.dart';
import 'package:https/api_client.dart';
import 'package:https/models/post.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Client().getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(snapshot.hasError.toString());
            } else {
              List<Post> l = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(printPost(l, index)),
                  );
                },
                itemCount: l.length,
              );
            }
          },
        ),
      ),
    );
  }

  String printPost(List<Post> posts, int index) {
    return "${posts[index].userId}, ${posts[index].id},${posts[index].title},${posts[index].body} ";
  }

  ListTile itemBuilderPost(int index) {
    return ListTile(
      title: Text("$index"),
    );
  }
}
