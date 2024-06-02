import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/components/appointment_card.dart';
import 'package:flutter_doc_appt/utils/config.dart';

class AppointmentPage extends StatefulWidget{
  const AppointmentPage({Key? key}): super(key: key);
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
  
}

enum FilterStatus {upcoming, complete, cancel}
class _AppointmentPageState extends State<AppointmentPage>{

  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules= [
    {
      "doctor_name": "ame",
      "doctor_profile": "assets/images/doctor1.jpeg",
      "category": "Dental",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "kathy",
      "doctor_profile": "assets/images/doctor2.jpeg",
      "category": "Cardiology",
      "status": FilterStatus.cancel
    },
    {
      "doctor_name": "helen",
      "doctor_profile": "assets/images/doctor3.jpg",
      "category": "Raspiration",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Jogn",
      "doctor_profile": "assets/images/doctor4.jpg",
      "category": "General",
      "status": FilterStatus.complete
    }
  ];
  @override
  Widget build(BuildContext context) {

    List<dynamic> filteredSchedules = schedules.where((var sch){
      switch(sch['status']){
        case 'upcoming':
          sch['status'] = FilterStatus.upcoming;
          break;
        case 'complete':
          sch['status'] = FilterStatus.complete;
          break;
          case 'cancel':
          sch['status'] = FilterStatus.cancel;
          break;
      }
      return sch['status'] == status;
    }).toList();
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for(FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(filterStatus == FilterStatus.upcoming){
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if(filterStatus == FilterStatus.complete){
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if(filterStatus == FilterStatus.cancel){
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                          child: Center(
                            child: Text(filterStatus.name)
                          ),
                        ))
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment, 
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold),),
                      ),),)
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index){
                  var schedule = filteredSchedules[index];
                  bool islastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color.fromARGB(255, 231, 221, 221)),
                      borderRadius: BorderRadius.circular(20)),
                      margin: !islastElement? const EdgeInsets.only(bottom: 15): EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(schedule["doctor_profile"]),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    schedule['doctor_name'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    schedule['category'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              )
                            ],),
                            Config.spaceSmall,
                            ScheduleCard(),
                            Config.spaceXS,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Config.primaryColor),
                                      backgroundColor: Color.fromARGB(178, 224, 243, 234)
                                    ),
                                    onPressed: (){}, 
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Config.primaryColor),
                                    ))),
                                const SizedBox(width: 15,),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Config.primaryColor,
                                      side: BorderSide(color: Config.primaryColor)
                                    ),
                                    onPressed: (){}, 
                                    child: const Text(
                                      'Reschedule',
                                      style: TextStyle(
                                        color: Colors.white),
                                    ))),
                              ],
                            )
                        ],),
                      ),
                  );
                })))
        ],),),
    );
  }
}

class ScheduleCard extends StatelessWidget{

  const ScheduleCard({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(120, 28, 112, 77),
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
            color: Colors.white,
            size: 15,
          ),
          
          Text(
            'Monday, 05/31/2024',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 40,),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          Flexible(
            child: Text('10:30',
            style: TextStyle(
              color: Colors.white),))
      ],),
    );
  }

}