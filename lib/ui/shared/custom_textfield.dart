import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
    final String? label;
    final  TextEditingController? textEditingController;
    final Function onChanged;
    final bool? isValid;
    final String? hintText;
    final bool? obscureText;
    final String? errorText;
     const CustomTextField({
      @required 
      this.label,
      @required
      this.textEditingController,
      required this.onChanged,
      @required
      this.isValid,
      @required
      this.hintText,
      this.obscureText,
      @required
      this.errorText
    });
    @override
  CustomTextFieldState createState()=> CustomTextFieldState();
}
class CustomTextFieldState extends State<CustomTextField>{
  @override
  Widget build(BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width/1.2,
            margin: const EdgeInsets.all(15.0),
            height: 50.0,
            child: TextField(
              controller: widget.textEditingController,
              onChanged:(text){
                if(widget.onChanged != null){
                 widget.onChanged(text);
              }},
              style:  TextStyle(color: Colors.blue[600]),
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: TextStyle( color: Colors.blue[600]),
                errorText: widget.errorText,
                
              ),
              obscureText: widget.obscureText == null ? false:true,
            ),
          );
  }
 
}