import 'package:flutter/material.dart';
import 'package:rest_api_tutorial/models/userPosts.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  List<UserPosts>? userPosts;
  var isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (
            context,
            index,
          ) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.yellow,
              child: const Text('List is on'),
            );
          }),
    );
  }
}
