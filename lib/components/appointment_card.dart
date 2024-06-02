import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/utils/config.dart';

class AppointmentCard extends StatefulWidget{
  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
  
}

class _AppointmentCardState extends State<AppointmentCard>{
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Config.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(padding: EdgeInsets.all(15),
          child: Column(children: [
            const Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/doctor1.jpeg'),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ame',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Dental',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                )
                  ],
                ),
              Config.spaceXS,
              const ScheduleCard(),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Config.primaryColor),
                        backgroundColor: Color.fromARGB(172, 240, 102, 38)
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white),
                      ))),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(120, 28, 112, 77),
                        side: BorderSide(color: Colors.grey.shade100)
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        'Complete',
                        style: TextStyle(
                          color: Colors.white),
                      ))),
                ],
              )
              ],),)
          )
        )
      );
  }
}

class ScheduleCard extends StatelessWidget{

  const ScheduleCard({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.only(left:25, right: 35, top: 10, bottom: 10),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
           Text(
            'Monday, 05/31/2024',
            style: TextStyle(color: Config.primaryColor),
          ),
          SizedBox(width: 40,),
           Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
           Flexible(
            child: Text('10:30',
            style: TextStyle(
              color: Config.primaryColor),))
      ],),
    );
  }

}