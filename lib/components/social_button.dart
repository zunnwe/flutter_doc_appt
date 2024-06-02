import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget{
  const SocialButton({Key? key, required this.title}): super(key: key);

  final String title;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlinedButton(
      onPressed: (){}, 
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/$title.png',
          width: 30,
          height: 30,
          ),
          // Text('$title')
      ],));
  }

}