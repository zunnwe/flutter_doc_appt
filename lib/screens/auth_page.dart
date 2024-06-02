import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/components/login_form.dart';
import 'package:flutter_doc_appt/components/sign_up.dart';
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
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(  //symmetric is used when horizontal and vertical padding is specified separately
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
              isSignIn
              ? AppText.entext['signIn_text']!
              : AppText.entext['register_text']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            isSignIn
            ? const LoginForm()
            : const SignUpForm(),
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
                      isSignIn
                      ? AppText.entext['signUp_text']!
                      : AppText.entext['registered_text']!,
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
                        setState(() {
                          isSignIn = !isSignIn;
                        });
                        // Navigator.push(
                        //  context, 
                        //  MaterialPageRoute(builder: (context) => const MainLayout()));
                      },
                      child: Text(
                        isSignIn
                        ? 'Sign Up'
                        : 'Sign In',
                        style: const TextStyle(color: Config.primaryColor),),
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