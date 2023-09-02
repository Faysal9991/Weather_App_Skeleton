import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/screens/auth/views/sign_up_Screen.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/text.style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  Text("Wellcome to SMSI",style: latoStyle700Bold.copyWith(fontSize: 30,color: Colors.white),),
                ],),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Email",)),
        
           const Padding(
             padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Password",)),
         const SizedBox(
            height: 20,
          ),
       Text.rich(
            TextSpan(
              text: 'If you dont have account please',
              style: latoStyle400Regular.copyWith(color: Colors.black45,fontSize: 10),
            
              children: [
      
                TextSpan(
                   recognizer: TapGestureRecognizer()..onTap = (){
         Helper.toScreen(context, const SignUpScreen() );
                   },
                  text: ' Sign Up',
                  style: latoStyle700Bold.copyWith(fontSize: 20,color:Colors.lightBlue),
                )
              ]
            )
          ),
          const Spacer(),
        const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            CircleAvatar(
            radius: 20,
        child: FaIcon(FontAwesomeIcons.google,color: Colors.red,)),
            SizedBox(width: 5,),
            CircleAvatar(
        radius: 20,
        child: FaIcon(FontAwesomeIcons.apple)),
        SizedBox(width: 5,), CircleAvatar(
         radius: 20,
         child: FaIcon(FontAwesomeIcons.facebook,color: Colors.blue,)),
            ],
        ),
        const SizedBox(height: 10,),
            Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
        child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(onPressed: (){Helper.toScreen(context, const HomePage());},child: const Text("login"),)),
            )
       ],
      ),
     
 );
  }
}
