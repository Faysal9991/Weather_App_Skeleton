import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/provider/admin.provider.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';
import 'package:weather_app/util/widgets/custom_appbar.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AdminProvider>(context,listen: false).getBkashNogodNumber();
        Provider.of<AdminProvider>(context,listen: false).getListofRequest();
    super.initState();
  }  
   TextEditingController ammount =TextEditingController();
    TextEditingController Phone =TextEditingController();
     TextEditingController trnjaction =TextEditingController();
  // List of items in our dropdown menu
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppColors.scaffold,
      body: Consumer2<AdminProvider,AuthProvider>(
       
        builder: (context,admin,auth,child) {
          return SingleChildScrollView(
            child: Column(children: [
              const CustomConatinerButton(),
              const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),  color: Colors.lightBlue,boxShadow: Helper.softUiShadow),
                        child:   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                                        textAlign : TextAlign.center,
                              TextSpan(
                                text: 'Bkash : ',
                                style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 12),
                              
                                children: [
                           
                                  TextSpan(
                                   
                                    text: admin.number!=null?"${admin.number!['bkash']}":"0",
                                     recognizer: TapGestureRecognizer()..onTap = () =>  Clipboard.setData(ClipboardData(text: "${admin.number!['bkash']}")),
                                    style: latoStyle400Regular.copyWith(fontSize: 12,color:Colors.black,fontWeight: FontWeight.bold),
                                  )
                                  ],)
                             ),
                        ),
                           
                      ),
                      const SizedBox(width: 10,),
                       Container(
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),  color: Colors.lightBlue,boxShadow: Helper.softUiShadow),
                        child:   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                                        textAlign : TextAlign.center,
                              TextSpan(
                                text: 'Nagad : ',
                                style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 12),
                              
                                children: [
                           
                                  TextSpan(
                                    text: admin.number!=null?'${admin.number!['nogod']}':"0",
                                    style: latoStyle400Regular.copyWith(fontSize: 12,color:Colors.black,fontWeight: FontWeight.bold),
                                                                     recognizer: TapGestureRecognizer()..onTap = () =>  Clipboard.setData(ClipboardData(text: "${admin.number!['nogod']}")),

                                  )],)
                             ),
                        ),
                           
                      )
                   
                    ],
                  ),
                         
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Container(
                width: width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.lightBlue),
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(textAlign:TextAlign.justify,
                           "উপরের যে কোন নম্বরে বিকাশ অথবা নগদে সেন্ড মানি করার পর আপনার যে নম্বর থেকে টাকা পঠিয়েছেন সেই নম্বর টাকার এমাউন্ট ও ট্রানজেকশন  আইডি টি পাঠান।",style: latoStyle500Medium.copyWith(color: Colors.white),),
               ),)),
               const Center(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                  ],
                 ),
               ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Enter your ammount",controller: ammount,)),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Enter your phone number",controller: Phone,)),
                     Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Enter transcaction id",controller: trnjaction,)),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
             child: SizedBox(
            width: width,
            child: ElevatedButton(onPressed: (){

              admin.sendMoneyRequest(auth.userModel.username.toString(), ammount.text,Phone.text,trnjaction.text);
            }, child: const Text("Send Information"))),
         ),
         const SizedBox(height: 100,)
       ]),
          );
        }
      ),
 
    );
  }
}