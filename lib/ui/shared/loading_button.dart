import 'package:flutter/material.dart';
class LoadingButton extends StatefulWidget {
  final String? label;
  final bool? isLoading;
  final Function? onPressed;
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
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[600],
            height: 50,
            child: MaterialButton(onPressed:(){widget.isLoading == true ? null : widget.onPressed;},
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