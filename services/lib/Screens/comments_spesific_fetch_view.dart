

import 'package:flutter/material.dart';
import 'package:services/Models/comments_model.dart';
import 'package:services/Services/comment_services.dart';

class CommentsFetchWithId extends StatefulWidget {

  final int id;
  const CommentsFetchWithId({Key? key, required this.id}) : super(key: key);

  @override
  State<CommentsFetchWithId> createState() => _CommentsFetchWithIdState();
}

class _CommentsFetchWithIdState extends State<CommentsFetchWithId> {

   List<CommentsModel>? commentItems;
   late final ICommentsServices commentsServices; 


   Future<void> fetchSpesificComments (int id) async {
      commentItems = await commentsServices.fetchCommentsWithId(id);
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentsServices = CommentsServices();
    fetchSpesificComments(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView.builder(
        itemCount: commentItems?.length,
        itemBuilder: (context, index) {
          return Card(child: Text("${commentItems?[index].email}"));
        },
      ) ,
    );
  }
}