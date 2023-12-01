import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/screens/auth/login_screen.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/util/theme/text.style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    // TODO: implement initState

   
  
        Future.delayed(
         const Duration(seconds: 3),
      (){
Provider.of<AuthProvider>(context,listen: false).getLoginAccess().then((value){
  if(value){
    Helper.toScreen(context, const HomePage());
  }else{
    Helper.toScreen(context, const LoginScreen());
  }
});
      }
       );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             Text("Check user Location",style: latoStyle800ExtraBold.copyWith(color: Colors.lightBlue,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}