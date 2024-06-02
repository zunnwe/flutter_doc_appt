import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/main_layout.dart';
import 'package:flutter_doc_appt/models/auth_model.dart';
import 'package:flutter_doc_appt/screens/auth_page.dart';
import 'package:flutter_doc_appt/screens/doctor_detail.dart';
import 'package:flutter_doc_appt/utils/config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //for push navigator
  static final navigatorkey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: MaterialApp(
      navigatorKey: navigatorkey,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        'main': (context) => const MainLayout(),
        'doctor_detail': (context) => const DoctorDetail()
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
      );
    
  }
}

