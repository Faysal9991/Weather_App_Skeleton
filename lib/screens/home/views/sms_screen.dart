import 'package:flutter/material.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/widgets/custom_appbar.dart';

class SmsScreeen extends StatefulWidget {
  const SmsScreeen({super.key});

  @override
  State<SmsScreeen> createState() => _SmsScreeenState();
}

class _SmsScreeenState extends State<SmsScreeen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffold,
    
    body: Column(children: [
      CustomConatinerButton(),
      SizedBox(height: 20,),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Phone number",)),
       
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Company name",)),


      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: Container(
          height: 150,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.lightBlue), color: Colors.white,),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
             focusedBorder: InputBorder.none,
             hintText: "Please input details"
          ),
        ),
        ),
      ),
        SizedBox(height: 10,),    

        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SizedBox(
            width: width,
            child: ElevatedButton(onPressed: (){}, child: Text("Send Sms"))),
        )  
    ],),
     );
  }
}