import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget{
  CustomAppbar({Key? key, this.appTitle, this.route, this.icon, this.actions}): super(key: key);

  final String? appTitle;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;

  State<CustomAppbar> createState() => _CustomAppBarState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppbar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(      
      // automaticallyImplyLeading: true,
      backgroundColor: Config.primaryColor,
      elevation: 0,
      title: Text(
          widget.appTitle!,
          style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        leading: widget.icon != null ? Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Config.primaryColor
          ),
          child: IconButton(
            onPressed: () {
                  //if route is given, then this icon button will navigate to that route
                  if (widget.route != null) {
                    Navigator.of(context).pushNamed(widget.route!);
                  } else {
                    //else, just simply pop back to previous page
                    Navigator.of(context).pop();
                  }
                },
            icon: widget.icon!,
            iconSize: 16,
            color: Colors.white,
            ),
        ): null,
        actions: widget.actions ?? null,
    );
  }
  
}