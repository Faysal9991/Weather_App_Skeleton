import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/text.style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController  userName = TextEditingController();
  TextEditingController  email = TextEditingController();
  TextEditingController  phoneNumber = TextEditingController();
  TextEditingController  password = TextEditingController();
   TextEditingController  conPassword = TextEditingController();
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        
        builder: (context, authProvider,child) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
                        color:Colors.pink,
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
                   Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Username",controller: userName,
                    validation: (value){
                         if(value!.isEmpty){
                           return 'User Name is required';
                         }
                         return null;
                       },)),
              
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Email",controller: email,
                     validation: (value){
                         if(value!.isEmpty){
                           return 'Email is required';
                         }
                         return null;
                       },
                    )),
                           Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Phone number",controller: phoneNumber,
                     validation: (value){
                         if(value!.isEmpty){
                           return 'Phone is required';
                         }
                         return null;
                       },)),
                           Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Password",controller: password,
                     validation: (value){
                         if(value!.isEmpty){
                           return 'Password is required';
                         }
                         return null;
                       },)),
                         Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Confirm assword",controller: conPassword,
                     validation: (value){
                         if(value!.isEmpty){
                           return 'Confirm password is required';
                         }
                         return null;
                       },)),
            
                       Padding(
                         padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                         child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Consumer<AuthProvider>(
                            
                              builder: (context, authPro,child) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                                  onPressed: (){
                                    if (_formKey.currentState!.validate()){
                                         authPro.signUp(email:email.text,phoneNumber: phoneNumber.text,username: userName.text,password: password.text).then((value){
                               if(value){
                             Helper.toReplacementScreenSlideRightToLeft(HomePage(),context);
                               }
                             });
                                    }
                          
                       
                                },child: const Text("create"),);
                              }
                            )),
                       ),
            
                    SizedBox(height: 50,)   
                ],
              ),
            ),
          );
        }
      ),

    
    );
  }
}
