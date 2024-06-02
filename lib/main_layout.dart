import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/screens/appointment_page.dart';
import 'package:flutter_doc_appt/screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget{
  const MainLayout({Key? key}): super(key: key);

  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>{
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value){
          setState(() {
            currentPage = value;
          });
        }),
        children: <Widget>[
          const HomePage(),
          AppointmentPage()
        ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (page){
            setState(() {
              currentPage = page;
              _page.animateToPage(
                page, 
                duration: const Duration(milliseconds: 500), 
                curve: Curves.easeInOut);
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
              label: 'Home'),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
              label: 'Appointments'),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUser),
              label: 'Profile'),
          ],
        ),
    );
  }
  
}