import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/utils/config.dart';

class Button extends StatelessWidget{
  const Button({Key? key, required this.width, required this.title, required this.disabled, required this.onPressed}): super(key: key);

  final double width;
  final String title;
  final bool disabled;
  final Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: disabled? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize:  18,
            fontWeight: FontWeight.bold,
          )
        ),),
    );
  }
}