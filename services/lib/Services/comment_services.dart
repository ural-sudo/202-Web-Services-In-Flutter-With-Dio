
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:services/Models/comments_model.dart';


abstract class ICommentsServices{
  Future<List<CommentsModel>> fetchCommentsData ();
  Future<bool>postAddComments(CommentsModel model);
  Future<bool> putUpdateComments(CommentsModel model, int id);
  Future<List<CommentsModel>> fetchCommentsWithId(int id);
} 

class CommentsServices implements ICommentsServices{
  final Dio networkManager = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  @override
  Future<List<CommentsModel>> fetchCommentsData () async {

    final response = await networkManager.get(endPointItems.comments.name);

    if(response.statusCode == HttpStatus.ok){

      final commentDatas = response.data;
      if(commentDatas is List){
        return commentDatas.map((e) => CommentsModel.fromJson(e)).toList();
      }
    }
    return [];
  }

  Future<bool> postAddComments(CommentsModel model) async {

    final response = await networkManager.post(endPointItems.comments.name,data: model);
    return response.statusCode == HttpStatus.created;
  }

  Future<bool> putUpdateComments(CommentsModel model, int id) async {

    final response = await networkManager.put("${endPointItems.comments.name}/$id",data: model);
    return response.statusCode == HttpStatus.ok;
  }

  Future<List<CommentsModel>> fetchCommentsWithId(int id) async {

    final response = await networkManager.get(
      endPointItems.comments.name,queryParameters:{'postId':id} 
    );

    if(response.statusCode == HttpStatus.ok){

      final spesificDatas = response.data;

      if(spesificDatas is List){

        return spesificDatas.map((e) => CommentsModel.fromJson(e)).toList();
      }
    }
    return[];

  }

}

enum endPointItems {
  posts,comments,users,albums
}