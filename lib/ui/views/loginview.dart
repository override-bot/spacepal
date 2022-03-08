import 'package:flutter/material.dart';
import 'package:spacepal/core/services/authentication.dart';
import 'package:spacepal/core/services/media_services.dart';
import 'package:spacepal/ui/shared/alert.dart';
import 'package:spacepal/ui/shared/custom_textfield.dart';
import 'package:spacepal/ui/shared/loading_button.dart';
import 'package:spacepal/utils/router.dart';

import 'homeview.dart';
import 'signupview.dart';
class LoginView extends StatefulWidget{
  @override
  LoginViewState createState()=> LoginViewState();
}
class LoginViewState extends State<LoginView>{
   AuthenticationService auth = AuthenticationService();
   bool isLoading = false;

   TextEditingController _emailField = TextEditingController();
   TextEditingController _passwordField = TextEditingController();
   RouteController routeController = RouteController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          height:MediaQuery.of(context).size.height,
            width: double.infinity,
            color:Colors.white,
            child: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
Container(
                          width:MediaQuery.of(context).size.width/1.5,
                          height:MediaQuery.of(context).size.height/4,
                          margin: const EdgeInsets.only(bottom: 10, top:40),
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/undraw_Co_workers_re_1i6i.png',
                              
                              ),
                              fit: BoxFit.contain
                            )
                          )
                        ),
                        Container(height:20),
                        Text(
                          "Login",
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
                            print('text');
                          },
                          isValid: true,
                           hintText: "somto@nasrda.com",
                            errorText:null),
                             Container(height: 20,),
                            CustomTextField(label: "Password", 
                            textEditingController: _passwordField,
                             onChanged: (text){
                                print("text");
                             },
                              isValid: true,
                               hintText: null, 
                               errorText: null,
                               obscureText:true),
                                Container(height: 20,),
                                 LoadingButton(label: "Login",
                               isLoading: isLoading,
                                onPressed:
                                 (){
                                      setState(() {
                                        isLoading = true;
                                      });
                                      auth.login(_emailField.text, _passwordField.text).then((value) {
                                        routeController.pushAndRemoveUntil(context, HomeView());
                                      }).catchError((e){
                                          showAlert(context, e.message);
                                      });
                                      setState(() {
                                        isLoading = false;
                                      });
                                      }
                                      ),
                                       Container(height: 20,),
                                      GestureDetector(
                                        onTap:(){routeController.push(context, SignupView());},
                                        child:const Text("Don't have an account? Sign up")
                                      ),
                                       Container(height: 20,),
                ]
              )
            )));
  
  }
}