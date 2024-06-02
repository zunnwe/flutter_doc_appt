import 'package:flutter/material.dart';
import 'package:flutter_doc_appt/components/button.dart';
import 'package:flutter_doc_appt/main.dart';
import 'package:flutter_doc_appt/models/auth_model.dart';
import 'package:flutter_doc_appt/providers/dio_provider.dart';
import 'package:flutter_doc_appt/utils/config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginForm extends StatefulWidget{
  const LoginForm({Key? key}): super(key: key);
  
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key : _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _pwdController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePass = !obsecurePass;
                  });
                },
                icon: obsecurePass
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black38,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Config.primaryColor,
                      ))),
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(builder: (context, auth, child){
            return Button(
              width: double.infinity, 
              title: 'Sign In', 
              disabled: false, 
              onPressed: () async{
                final token = await DioProvider()
                .getToken(_emailController.text, _pwdController.text);

                if(token){
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  final tokenValue = prefs.getString('token')?? '';

                  if(tokenValue.isNotEmpty && tokenValue != ''){
                    final response = await DioProvider().getUser(tokenValue);
                    if(response != null){
                      setState(() {
                        
                        Map<String, dynamic> appointments = {};
                        final user = json.decode(response);

                        auth.loginSuccess();
                        MyApp.navigatorkey.currentState!.pushNamed('main');
                      });
                    }
                  }
                }
              // Navigator.of(context).pushNamed('main');
              });
          })
    ],));
  }
}
