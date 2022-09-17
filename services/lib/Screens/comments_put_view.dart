import 'package:flutter/material.dart';
import 'package:services/Models/comments_model.dart';
import 'package:services/Services/comment_services.dart';


class CommentsPutView extends StatefulWidget {
  const CommentsPutView({Key? key}) : super(key: key);

  @override
  State<CommentsPutView> createState() => _CommentsPutViewState();
}

class _CommentsPutViewState extends State<CommentsPutView> {

  final TextEditingController postIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  late final ICommentsServices commentService;

  final String postIdLabel = "Post Id";
  final String nameLabel = "Name";
  final String emailLabel = "E-mail";
  final String bodyLabel = "Body";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentService = CommentsServices();
  }

  Future<void> updateComments(CommentsModel model, int id) async {

    commentService.putUpdateComments(model, id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommentsTextFeldWidget(controller: postIdController,labelText:postIdLabel,),
            CommentsTextFeldWidget(labelText: nameLabel ,controller: nameController),
            CommentsTextFeldWidget(labelText: emailLabel, controller: emailController),
            CommentsTextFeldWidget(labelText: bodyLabel, controller: bodyController),
            TextButton(onPressed: (){

              if(postIdController.text.isNotEmpty &&
                  nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  bodyController.text.isNotEmpty ){

                    final CommentsModel model = CommentsModel(
                      body: bodyController.text,
                      email: emailController.text,
                      postId:int.tryParse(postIdController.text),
                      name: nameController.text
                    );

                    updateComments(model, 5);
                  }

            }, child: Text("Send")),
            
          ],
        ),
      ),
    );
  }
}

class CommentsTextFeldWidget extends StatelessWidget {
  const CommentsTextFeldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10,left: 20,right: 20),
      child: Container(
        decoration:BoxDecoration(
          color: Colors.lime,
          border: Border.all(width: 1,color: Colors.lime),
          borderRadius: BorderRadius.circular(10)
        ) ,
        child: TextField(
          keyboardType: TextInputType.number,
          controller:controller ,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}