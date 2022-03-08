import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacepal/core/models/staff_model.dart';
import 'package:spacepal/core/services/authentication.dart';
import 'package:spacepal/core/viewmodels/user_view_model.dart';
import 'package:spacepal/ui/shared/loading_button.dart';
import 'package:spacepal/utils/router.dart';

import 'introscreen.dart';
import 'post_add_view.dart';

class UserView extends StatefulWidget{
  @override
  UserViewState createState()=> UserViewState();
}
class UserViewState extends State<UserView>{
  final User? user = FirebaseAuth.instance.currentUser;
  AuthenticationService auth = AuthenticationService();
  RouteController router = RouteController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
   return FutureBuilder<Staff>(
future: userProvider.getStaffById(user!.uid),
builder:(context,snapshot){
  if(snapshot.hasData){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle:false,
        elevation: 0.0,
       leading:IconButton(onPressed:null, icon:Icon(Icons.notifications, color:Colors.blue[600])),
        actions: [
         IconButton(onPressed: (){
                auth.signOut().then((value) => router.pushAndRemoveUntil(context, IntroScreen()));

         }, icon: Icon(Icons.logout,color:Colors.blue[600]))
        ],
      ),
      body: Container(
        height:double.infinity,
        width:double.infinity,
        color:Colors.white,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: MediaQuery.of(context).size.width/4,
              backgroundImage: NetworkImage(snapshot.data!.imageUrl),
            ),
            Container(height:10),
            Text(
              snapshot.data!.username,
              style:TextStyle(
                fontSize: 20,
                fontWeight:FontWeight.w600,
                color:Colors.blue[600]
              )

            ),
            Container(height:10),
              Text(
              snapshot.data!.unit,
              style:TextStyle(
                fontSize: 18,
                fontWeight:FontWeight.w500,
                color:Colors.grey[700]
              )

            ),
             Container(height:10),
              Text(
              snapshot.data!.email,
              style:TextStyle(
                fontSize: 18,
                fontWeight:FontWeight.w500,
                color:Colors.grey[700]
              )

            ),
            Container(height:10),
            snapshot.data!.isAdmin == true ? Container(
              child: LoadingButton(label: "post important info", isLoading: false, onPressed: (){
                router.push(context, PostAddView(isImportant: true));
              }),
            ):Container()
          ]
        )
      ),
    );
  }
  return Container();
} ,
   );
  }

}