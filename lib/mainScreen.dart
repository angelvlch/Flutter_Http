import 'package:flutter/material.dart';
import 'package:http/api_client.dart';
import 'package:http/post.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Post>> posts;
  @override
  void initState() {
    super.initState();
    posts = Client().getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: SafeArea(
        child: Container(
            child: FutureBuilder(
                future: posts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.hasError.toString());
                  } else {
                    List<Post> l = snapshot.data!.toList();
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(foo(l, index)),
                        );
                      },
                      itemCount: l.length,
                    );
                  }
                })),
      ),
    );
  }

  String foo(List<Post> l, int index) {
    return "${l[index].userId} and ${l[index].id}";
  }
}
