// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spacepal/utils/router.dart';


import 'important_view.dart';
import 'post_add_view.dart';
import 'postview.dart';
import 'userview.dart';

class HomeView extends StatefulWidget{
  @override
  
HomeViewState createState()=> HomeViewState();
}
class HomeViewState extends State<HomeView>{
   PageController _myPage = PageController(initialPage: 0);
   int selectedPage = 0;
   RouteController router = RouteController();
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
    
     floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
     floatingActionButton: FloatingActionButton(onPressed: (){
       router.push(context, PostAddView(isImportant: false,));
     },backgroundColor: Colors.blue[600],
    
     child:const Icon(Icons.edit, color:Colors.white),),
     bottomNavigationBar: BottomAppBar(
       shape:const CircularNotchedRectangle(),
       
       elevation: 2.0,
       child:Container(
         width: MediaQuery.of(context).size.width/1.3,
         height:50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize: 20.0,
              
                icon: Icon(Icons.home, color:selectedPage == 0? Colors.blue[600]:Colors.black),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 20.0,
              
                icon: Icon(Icons.notification_important,color:selectedPage == 1? Colors.blue[600]:Colors.red),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
                  });
                },
              ),
             
            IconButton(
                iconSize: 20,
                padding: EdgeInsets.only(right: 55),
                icon: Icon(Icons.person, color:selectedPage == 2? Colors.blue[600]:Colors.black),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(2);
                  });
                },
              ),
            ],
       )
     )
   ),
   body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
         selectedPage = int;
        },
        children: <Widget>[
         PostView(),
         ImportantView(),
         UserView()
        ],
        physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
   );
  }

}