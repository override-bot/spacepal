// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spacepal/ui/shared/loading_button.dart';
import 'package:spacepal/utils/router.dart';

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
          leading: Icon(Icons.info, color:Colors.blue[600]),
        ),
        body: Container(
          width:double.infinity,
          color: Colors.white,
          height:MediaQuery.of(context).size.height,
          child: Column(
             children: [
                        Container(
                          margin:const EdgeInsets.only(top:10),
                          child: Text(
                            'SPACEPAL',
                            style: TextStyle(
                              color:Colors.blue[600]
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
                    LoadingButton(label: "Continue", isLoading: false, onPressed: (){
                            if(FirebaseAuth.instance.currentUser == null){
                                routeController.pushAndRemoveUntil(context, SignupView());
                            }
                            else{

                            }
                    })

                ]
          ),
        ),
      );
  }
}