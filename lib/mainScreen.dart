import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: 10,
          ),
        ),
      ),
    );
  }

  ListTile _itemBuilder(BuildContext context, int index) {
    return ListTile(
        //  title: Text(await Client().getPost(),),
        );
  }
}
