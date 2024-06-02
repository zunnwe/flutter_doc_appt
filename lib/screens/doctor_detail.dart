import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/components/custom_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetail extends StatefulWidget{
  const DoctorDetail({Key? key}):super(key: key);

  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail>{

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Doctor Detail',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(onPressed: ()async{
            
          }, icon: FaIcon(
            isFav? Icons.favorite_rounded : Icons.favorite_outline,
            color: Colors.red,
          ))
      ],),
      body: SafeArea(child: Column(children: [],),),
    );
  }
}