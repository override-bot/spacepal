// ignore_for_file: prefer_final_fields, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spacepal/core/services/authentication.dart';
import 'package:spacepal/core/services/media_services.dart';
import 'package:spacepal/ui/shared/custom_textfield.dart';
import 'package:spacepal/ui/shared/loading_button.dart';
import 'package:spacepal/utils/router.dart';

import 'homeview.dart';
import 'loginview.dart';
class SignupView extends StatefulWidget {

  @override
  SignupViewState createState()=> SignupViewState();
}
class SignupViewState extends State<SignupView>{
  TextEditingController _emailField = TextEditingController();
   TextEditingController _passwordField = TextEditingController();
    TextEditingController _unitField = TextEditingController();
     TextEditingController _usernameField = TextEditingController();
     MediaServices mediaServices = MediaServices();
     AuthenticationService auth = AuthenticationService();
      RouteController routeController = RouteController();

     bool? isName;
    bool? isUnit;
    bool isLoading = false;
    bool? isEmail;
    bool? isPassword;
   late  File _image = File('assets/undraw_Co_workers_re_1i6i.png');
     int currentPage = 0;
     final PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            height:double.infinity,
            width: double.infinity,
            color:Colors.white,
            child: PageView(
             physics: NeverScrollableScrollPhysics(),
              controller:_myPage,
              onPageChanged:(int _page){
                currentPage = _page;
              },
              children:[
                Container(
                  color:Colors.white,
                  child: SingleChildScrollView(
                    child:Column(
                      children:[
                        Container(
                          width:MediaQuery.of(context).size.width/1.5,
                          height:MediaQuery.of(context).size.height/4,
                          margin: const EdgeInsets.only(bottom: 10, top:35),
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/undraw_Co_workers_re_1i6i.png',
                              
                              ),
                              fit: BoxFit.contain
                            )
                          )
                        ),
                        Text(
                          "Register",
                          style:TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize:28,
                            color:Colors.blue[600]
                          )
                        ),
                        Container(height: 20,),
                        CustomTextField(label:"Email" ,
                         textEditingController: _emailField,
                          onChanged: (text){
                           
                           if( RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)){
                             setState(() {
                               isEmail = true;
                             });
                           }
                           else{
                              setState(() {
                               isEmail = false;
                             });
                           }
                          }, 
                          isValid: isEmail,
                           hintText: "somto@nasrda.com",
                            errorText:isEmail == false? "Enter valid nasrda email":null),
                            CustomTextField(label: "Password", 
                            textEditingController: _passwordField,
                             onChanged: (text){
                               if(text.length >6 ){
                                 setState(() {
                                   isPassword = true;
                                 });
                               }
                               else{
                                 setState(() {
                                   isPassword = false;
                                 });
                               }
                             },
                              isValid: isPassword,
                               hintText: "", 
                               errorText:isPassword == false? "password must be more than 6 characters":null,
                               obscureText:true),
                               CustomTextField(label: "Name", 
                               textEditingController: _usernameField,
                                onChanged: (text){
                                  if(text.length < 3){
                                    setState(() {
                                      isName = false;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      isName = true;
                                    });
                                  }
                                },
                                 isValid: isName,
                                  hintText: 'eg. Chukwudi Wisdom', 
                                  errorText: isName == false?'Not a valid Name':null),
                                  CustomTextField(label: "Unit", 
                                  textEditingController: _unitField ,
                                  onChanged: (text){
                                        if(text.length < 3){
                                          setState(() {
                                            isUnit = false;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            isUnit = true;
                                          });
                                        }
                                  }, 
                                  isValid: isUnit, 
                                  hintText: "eg. ICT",
                                   errorText:isUnit == false? "Enter valid unit":null),
                                   Container(height:5.0),
                                  LoadingButton(label: "Next", 
                                  isLoading: false,
                                   onPressed: (){
                                     _myPage.jumpToPage(1);
                                   }),
                                   GestureDetector(
                                     onTap:(){
                                       routeController.push(context, LoginView());
                                     },
                                     child: const Text("Already have an account? Login instead")
                                   )
                      ]
                    )
                  )
                ),
                Container(
                          color:Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Add Photo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.blue[600]
                                ),
                              ),

                              Container(
                                height: 250,
                                width:250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(125),
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: MaterialButton(
                                  onPressed: (){
                                    mediaServices.selectImage().then((image) {
                                      setState(() {
                                        _image = image;
                                      });
                                    });
                                  },
                                  child:_image == null ? Icon(Icons.add_a_photo, color: Colors.blue[600], size:40)
                                  :Container(
                                    width: 250,
                                    height:250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(125),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:FileImage(_image)
                                      )
                                    )
                                  )
                                  ),
                              ),
                            Container(
            width: MediaQuery.of(context).size.width/1.3,
            color: Colors.blue[600],
            height: 50,
            margin:const EdgeInsets.only(bottom:10),
            child: MaterialButton(onPressed:isName == true && isPassword == true && isEmail == true && _image != null?(){
              setState(() {
                isLoading = true;
              });
              auth.createStaff(_emailField.text, _passwordField.text, _unitField.text, false, _image, _usernameField.text).then((value){
                routeController.pushAndRemoveUntil(context, HomeView());
                setState(() {
                  isLoading = false;
                });
              });
            }:null,
            child: isLoading == true ? const Center(child: CircularProgressIndicator(color: Colors.white,)):const Text(
                  "Register",
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    ),

            )
            ),

        )
                            ],
                          ),

                ),
                
              ]
            )
          )
    );
  }


}