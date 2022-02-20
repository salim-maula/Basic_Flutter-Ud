import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_only/model/post.dart';
import 'package:http/http.dart' as http;

//Kita menggunakan-> https://jsonplaceholder.typicode.com/guide/

class FlutterNetworkPage extends StatefulWidget {
  @override
  _FlutterNetworkPageState createState() => _FlutterNetworkPageState();
}

class _FlutterNetworkPageState extends State<FlutterNetworkPage> {
  Map post;
  List<Post> listPost = [];

  void getPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    try {
      var responses = await http.get(Uri.parse(url));
      if (responses.statusCode == 200) {
        Map responseBody = jsonDecode(responses.body);
        post = responseBody;
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  void getListPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      var responses = await http.get(Uri.parse(url));
      if (responses.statusCode == 200) {
        List responseBody = jsonDecode(responses.body);
        responseBody.forEach((itemPost) {
          listPost.add(Post.fromJson(itemPost));
        });
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  void sendPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      print('Send Request');
      var responses = await http.post(Uri.parse(url), body: {
        'title': 'foo',
        'body': 'bar',
        'userId': 1.toString(),
      });
      print(responses.statusCode.toString());
        var responseBody = jsonDecode(responses.body);
        print(responseBody.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getPost();
    getListPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark Animal Page'),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Send/Post Data'),
              tileColor: Colors.grey[300],
            ),
            ElevatedButton(
              onPressed: ()=> sendPost(),
              child: Text('Send/Post Data'),
            ),
            ListTile(
              title: Text('Fetch Single Data'),
              tileColor: Colors.grey[300],
            ),
            if (post != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Id : ${post['userId']}'),
                    Text('Id : ${post['id']}'),
                    Text('Title : ${post['title']}'),
                    Text('Body : ${post['body']}'),
                  ],
                ),
              ),
            ListTile(
              title: Text('Fetch List Data'),
              tileColor: Colors.grey[300],
            ),
            if (listPost.isNotEmpty)
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  thickness: 1,
                ),
                itemCount: listPost.length,
                itemBuilder: (context, index) {
                  Post itemPost = listPost[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${itemPost.id}'),
                    ),
                    title: Text(itemPost.title),
                    subtitle: Text(itemPost.body),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
