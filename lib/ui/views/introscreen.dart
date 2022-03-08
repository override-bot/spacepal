// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spacepal/ui/shared/loading_button.dart';
import 'package:spacepal/utils/router.dart';

import 'homeview.dart';
import 'signupview.dart';

class IntroScreen extends StatefulWidget{
  @override
  IntroScreenState createState()=> IntroScreenState();
}
class IntroScreenState extends State<IntroScreen>{
  RouteController routeController = RouteController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.info_outline, color:Colors.blue[600]),
          backgroundColor: Colors.white,
          elevation: 0.0
        ),
        body: Container(
          width:double.infinity,
          color: Colors.white,
          height:MediaQuery.of(context).size.height/1.1,
          child: Column(
             children: [
                        Container(
                          margin:const EdgeInsets.only(top:10),
                          child: Text(
                            'SPACEPAL',
                            style: TextStyle(
                              color:Colors.blue[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )
                          )
                        ),
Container(height:70),
                        Container(
                          height: MediaQuery.of(context).size.height/3,
                          width:MediaQuery.of(context).size.width/1.5,
                          margin: EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/undraw_Co_workers_re_1i6i.png')
                              ,
                              fit: BoxFit.contain
                              )
                          ),
                        ),
                        Expanded(child: Container()),
                   Container(
            width: MediaQuery.of(context).size.width/1.3,
            color: Colors.blue[600],
            height: 50,
            margin:const EdgeInsets.only(bottom:10),
            child: MaterialButton(onPressed:(){
             if(FirebaseAuth.instance.currentUser == null){
               routeController.push(context, SignupView());
             }
             else{
               routeController.pushAndRemoveUntil(context, HomeView());
             }
            },
            child: Text(
              "Continue",
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    ),

            )
            ),

        )

                ]
          ),
        ),
      );
  }
}