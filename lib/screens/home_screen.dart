import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rest_api_tutorial/models/userPosts.dart';
import 'package:rest_api_tutorial/services/remote_services.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  List<UserPosts>? userPosts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetching from Api
    getData();
  }

  getData() async {
    userPosts = await RemoteService().getPosts();

    if (userPosts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    getData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: _shimmerEffect(),
        child: ListView.builder(
            itemCount: userPosts?.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  trailing: Text(userPosts![index].userId.toString()),
                  title: Text(userPosts![index].title),
                  leading: Text(userPosts![index].id.toString()),
                ),
              );
            }),
      ),
    );
  }

  _shimmerEffect() {
    return Center(
      child: SizedBox(
        width: 200.0,
        height: 100.0,
        child: Shimmer.fromColors(
          baseColor: Colors.blue,
          highlightColor: Colors.yellow,
          child: const Text(
            'Please Wait...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
