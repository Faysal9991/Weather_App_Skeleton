import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/text.style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
                color:Colors.lightBlue,
                boxShadow: Helper.softUiShadow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const Icon(Icons.email_rounded,size: 100,color: Colors.white,),
                  Text("Lets create a account",style: latoStyle700Bold.copyWith(fontSize: 30,color: Colors.white),),
                ],),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Username",)),
    
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Email",)),
                  const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Phone number",)),
                  const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Password",)),
                const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Confirm assword",)),
        ],
      ),
  floatingActionButton:  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: SizedBox(
     width: double.infinity,
     height: 40,
     child: ElevatedButton(onPressed: (){},child: const Text("create"),)),
  ),
    
    );
  }
}
