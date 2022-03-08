import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacepal/core/models/posts_model.dart';
import 'package:spacepal/core/models/staff_model.dart';
import 'package:spacepal/core/viewmodels/post_view_model.dart';
import 'package:spacepal/core/viewmodels/user_view_model.dart';
import 'package:spacepal/utils/router.dart';

class PostAddView extends StatefulWidget{
  final bool isImportant;
  PostAddView({
    required this.isImportant
  });
  @override
  PostAddViewState createState()=> PostAddViewState();
}
class PostAddViewState extends State<PostAddView>{
  RouteController router = RouteController();
  TextEditingController _postField = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
     final userProvider = Provider.of<UserViewModel>(context);
     final postProvider = Provider.of<PostViewModel>(context);
   return Scaffold(
     appBar: AppBar(
       backgroundColor:Colors.white,
       elevation:0.0,
     leading:IconButton(icon:Icon(Icons.arrow_back, color:Colors.blue[600]), onPressed:(){
       router.pop(context);
     },
    
     ),
     actions:[
       IconButton(onPressed: ()async{
      var snapshot = await   userProvider.getStaffById(user!.uid);
         postProvider.addPosts(Posts(post: _postField.text, posterId: user!.uid, username: snapshot.username,
         imageUrl: snapshot.imageUrl, timeStamp: DateTime.now(), isImportant: widget.isImportant)).then((value) {
           router.pop(context);
         });
       }, icon: Icon(Icons.post_add, color:Colors.blue[600]))
     ],
     title:Text("Add General Post",
     style: TextStyle(
       color:Colors.blue[600],
       fontSize: 20,
       fontWeight:FontWeight.w500
     ))
     ),
     body:Container(
       height:MediaQuery.of(context).size.height,
       padding: EdgeInsets.all(20),
       color: Colors.white,
       width: MediaQuery.of(context).size.width,
       child: TextFormField(
controller:_postField,
minLines:100,
maxLines: 250,
maxLength:750,
autofillHints:const ["How are we doing today","whats going on at the office today"],
decoration: InputDecoration(
  hintText: "What is going on?"
),
       ),
     )
   );
  }

}