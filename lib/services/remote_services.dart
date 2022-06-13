import 'dart:developer';

import 'package:rest_api_tutorial/models/userPosts.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<UserPosts>> getPosts() async {
    //we call Client so that we don't have to call it again and again later.
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    //if you want to specify headers than u can do in .get(uir, header)
    var response = await client.get(uri);
    log(response.toString()); //checking response was success or not
    if (response.statusCode == 200) {
      //getting actual json stream
      var json = response.body;
      //posting it into our model... this will give us the lists of post
      return userPostsFromJson(json);
    } else {
      log('$response');
    }
    throw UnimplementedError('Error while fetching api');
  }
}
