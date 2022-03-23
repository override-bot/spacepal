import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacepal/core/models/posts_model.dart';
import 'package:spacepal/core/viewmodels/post_view_model.dart';
import 'package:spacepal/utils/date_time.dart';
import 'package:readmore/readmore.dart';

class PostView extends StatefulWidget {
  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  List<Posts> posts = [];
  TimeFormat timeFormat = TimeFormat();
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text("spacepal",
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 22,
                fontWeight: FontWeight.w600,
              )),
          centerTitle: false,
          actions: [
            Icon(Icons.notifications, color: Colors.blue[600]),
          ],
          elevation: 0.0,
        ),
        body: Container(
            height: double.infinity,
            color: Colors.grey[200],
            child: StreamBuilder(
                stream: postProvider.streamPosts(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    posts = snapshot.data!.docs
                        .map((doc) => Posts.fromMap(doc.data() as Map, doc.id))
                        .toList();
                    if (posts.length > 0) {
                      return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                        leading: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.blue,
                                            backgroundImage: NetworkImage(
                                                posts[index].imageUrl)
                                            //  backgroundImage: NetworkImage(posts[index].imageUrl),
                                            ),
                                        title: Text(posts[index].username,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        subtitle: Text(
                                            "${timeFormat.displayDate(posts[index].timeStamp)} at ${timeFormat.displayTime(posts[index].timeStamp)}")),
                                    Container(height: 3),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 15, bottom: 10),
                                        child: ReadMoreText(
                                          posts[index].post,
                                          trimLines: 5,
                                          colorClickableText: Colors.blue[600],
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'read more',
                                          trimExpandedText: 'show less',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Colors.black),
                                        ))
                                  ]),
                            );
                          });
                    } else {
                      return Center(
                          child: Text("No Posts Yet...",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[600])));
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green[600],
                    ),
                  );
                })));
  }
}
