import 'package:flutter/material.dart';
import 'Screens/comments_fetch_view.dart';
import 'Screens/comments_post_view.dart';
import 'Screens/comments_put_view.dart';
import 'Screens/comments_spesific_fetch_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:CommentsFetchView(),
    );
  }
}


