import 'package:flutter/material.dart';
class LoadingButton extends StatefulWidget {
  final String? label;
  final bool? isLoading;
  final Function()?onPressed;
 const LoadingButton({
    @required
    this.label,
    @required
    this.isLoading,
   @required
    this.onPressed
  });

 @override
 LoadingButtonState createState()=> LoadingButtonState();
}
class LoadingButtonState extends State<LoadingButton>{

  @override
  Widget build(BuildContext context) {
        return Container(
            width: MediaQuery.of(context).size.width/1.3,
            
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(15)
            ),
            margin:const EdgeInsets.only(bottom:10),
            child: MaterialButton(onPressed:widget.onPressed,
            child: widget.isLoading == true ? const Center(child: CircularProgressIndicator(color: Colors.white,)):Text(
                    widget.label ?? "",
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    ),

            )
            ),

        );
  }

}