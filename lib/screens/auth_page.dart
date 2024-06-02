import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/components/login_form.dart';
import 'package:flutter_doc_appt/components/social_button.dart';
import 'package:flutter_doc_appt/main_layout.dart';
import 'package:flutter_doc_appt/utils/config.dart';
import 'package:flutter_doc_appt/utils/text.dart';

class AuthPage extends StatefulWidget{
  const AuthPage({Key? key}): super(key: key);

  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(padding: const EdgeInsets.symmetric(  //symmetric is used when horizontal and vertical padding is specified separately
        horizontal: 15,
        vertical: 15,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppText.entext['welcome_text']!,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Text(
              AppText.entext['signIn_text']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            const LoginForm(),
            const Spacer(),
            Center(
              child: Text(
                AppText.entext['social-login']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500
                  ),
              ),),
              Config.spaceXS,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialButton(title: 'google'),
                  SizedBox(width: 15),
                  SocialButton(title: 'facebook2'),
                  SizedBox(width: 15),
                  SocialButton(title: 'linkedIn'),
                ],),
                Config.spaceXS,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppText.entext['signUp_text']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500
                      ),
                    ),
                    // TextButton(
                    //   onPressed: (){}, 
                    //   child: Text('Sign Up'))
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => MainLayout()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Config.primaryColor),),
                    )
                  ],
                )
          ],
        )
      ),
      ),
    );
  }
  
}