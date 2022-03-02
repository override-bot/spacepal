import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacepal/core/viewmodels/user_view_model.dart';

import 'core/viewmodels/post_view_model.dart';
import 'locator.dart';
import 'ui/views/introscreen.dart';

void main() {
  setupLocator();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
   final PostViewModel postViewModel = locator<PostViewModel>();
   final UserViewModel userViewModel = locator<UserViewModel>();
  @override
  Widget build(BuildContext context) {
   return MultiProvider(providers: 
        [
            ChangeNotifierProvider(create: (_){
              return postViewModel;
            }),
              ChangeNotifierProvider(create: (_){
              return userViewModel;
            })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:'spacepal',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            
          ),
          home:  IntroScreen(),
        ),
   );
  }
}

