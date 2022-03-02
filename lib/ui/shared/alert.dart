import 'package:flutter/material.dart';

void showAlert(context, message) async{
      showDialog(context: context,
       builder: (context){
         return AlertDialog(
           // ignore: sized_box_for_whitespace
           content: Container(
                height: 90,
                width: MediaQuery.of(context).size.width/1.1,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontSize: 18,
                  
                  ),
                ),
           ),
         );
       }
       );
}