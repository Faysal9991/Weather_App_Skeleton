import 'package:flutter/material.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';
import 'package:weather_app/util/widgets/custom_appbar.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  List sms =[
"SMS",
"50",
"100",
"120",
"150",
"200",
"250",
"300"
];
 List money =[
"Taka",
"30",
"70",
"90",
"110",
"150",
"180",
"190"

  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppColors.scaffold,
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomConatinerButton(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Container(
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.lightBlue),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                    Text(
                         'আমাদের নাম্বরে সেন্ড মানি বিকাশ  বা নগদ সেন্ড মানি করার পর আপনার নম্বর এবং ট্রানজেকশন  আইডি  দিয়ে ভেরিভাই করুন ব্যালেন্স এড হয়ে যাবে।',
                          style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 12),
                  ),
                       const Divider(),
                       Text(textAlign:TextAlign.justify,
                        "আমাদের কাছে থেকে আপনি চাইলে অ্যাপ কিনে নিতে পারেন এবং বিজনেস করতে পারবেন, ৮০০ টাকা  এপ এর দাম,  অ্যাপ নিতে হলে যা প্রয়োজন পড়বে অপনার ইমেইল আপনার নম্বর  এবং হাফ পেমেন্ট  দিতে হবে আগে।",style: latoStyle500Medium.copyWith(color: Colors.white),),
            
               ],
             ),
           ),)),
          
         ListView.builder(
          shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
          itemCount: sms.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 1),
            child: Container(
              height: 40,
                  width: width,
                  decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(10)),
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("${sms[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),),
             Text("${money[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),)
                  ]),
            ),
          );
         })
          ]),
      ),
 
    );
  }
}