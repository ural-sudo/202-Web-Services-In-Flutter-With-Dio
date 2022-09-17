import 'package:flutter/material.dart';
import 'package:services/Models/comments_model.dart';
import 'package:services/Services/comment_services.dart';



class CommentsFetchView extends StatefulWidget {
  const CommentsFetchView({Key? key}) : super(key: key);

  @override
  State<CommentsFetchView> createState() => _CommentsFetchViewState();
}

class _CommentsFetchViewState extends State<CommentsFetchView> {

  List<CommentsModel>? commentItems;
  late final CommentsServices commentService;

  Future<void> fetchCommentDatas() async {
    commentItems = await commentService.fetchCommentsData();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentService = CommentsServices();
    fetchCommentDatas();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
         centerTitle:true,  
         title: Text("Comment Items"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: commentItems?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                color: Colors.amber,
                child: Column(
                  children: [
                    Text("${commentItems?[index].name}"),
                    Text("${commentItems?[index].body}"),
                  ],
                )
              ),
            );
          },
        ),
      ),
    );
  }
}