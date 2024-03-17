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
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(printPost(snapshot.data!, index)),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }

            if (snapshot.hasError) {
              return Text(snapshot.hasError.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  String printPost(List<Post> posts, int index) {
    return "userId: ${posts[index].userId}\nid: ${posts[index].id}\ntitle: ${posts[index].title}\nbody: ${posts[index].body} ";
  }
}
