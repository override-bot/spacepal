import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spacepal/core/models/posts_model.dart';
import 'package:spacepal/core/services/postapi.dart';
import 'package:spacepal/locator.dart';

class PostViewModel extends ChangeNotifier {

  PostApi postApi = locator<PostApi>();
  List<Posts> posts = [];
  Future<List<Posts>> getPosts() async{
      var result = await postApi.getDocuments();
      posts = result.docs
              .map((doc) => Posts.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
      return posts;
  }
  Stream<QuerySnapshot> streamPosts(){
      return postApi.streamDocuments();
  }
  Future<Posts> getPostById(String id) async{
    var doc = await postApi.getDocumentById(id);
    return Posts.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }
  Future addPosts(Posts data){
        var result = postApi.addData(data.toJson());
        return result;
  }
}
