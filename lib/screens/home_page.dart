import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/components/appointment_card.dart';
import 'package:flutter_doc_appt/components/doctor_card.dart';
import 'package:flutter_doc_appt/providers/dio_provider.dart';
import 'package:flutter_doc_appt/screens/appointment_page.dart';
import 'package:flutter_doc_appt/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomePage extends StatefulWidget{

  const HomePage({Key? key}): super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  Map<String, dynamic> user = {};

  List<Map<String, dynamic>> medcat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General"
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology"
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respirations"
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatology"
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynecology"
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental"
    },
  ];

  Future<void> getDate() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')?? '';
    if(token.isNotEmpty && token != ''){
      final response = await DioProvider().getUser(token);
      if(response != null){
        setState(() {
          user = json.decode(response);
          print(user);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Config().init(context);   //for state change
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15
        ),
        child: SafeArea(child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Chimmy',
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/chimmy.jpg'),
                    ),
                  ),
                ],),
                Config.spaceMedium,
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceXS,
                SizedBox(
                  height: Config.heightSize*0.08,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medcat.length, (index){
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15, 
                            vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FaIcon(medcat[index]['icon'],
                                color: Colors.white),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  medcat[index]['category'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                  ),
                                )
                            ],),),
                      );
                    },
                  ),
                ),),
                Config.spaceSmall,
                const Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Config.spaceSmall,
                AppointmentCard(),
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                  Config.spaceXS,
                  Column(
                    children: List.generate(10, (index){
                      return const DoctorCard(
                        route: 'doctor_detail',
                      );
                    })
                  )
            ],),
        ),),
      ),
    );
  }
}