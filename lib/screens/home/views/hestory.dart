import 'package:flutter/material.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';
import 'package:weather_app/util/widgets/custom_appbar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List userName =[
"User name",
"Akkas",
"Robin",
"Mamun",
"Rabbi shakhi",
"Mahadi hossin",
"Rolibul islam",
"GameZone",
"Sadik Hoissin"
"Bappi chowdury",
"Evan Alom"
];
 List balance =[
"balance ",
"100",
"50",
"200",
"500",
"300",
"200",
"100",
"700",
"300",
"100"
  ];
   List hours =[
"Hours",
"23 Min",
"40 Min",
"1 Hour",
"1.2 H",
"1.7 H",
"2 Hours",
"2.23 H",
"2.40 H",
"3.10 H",
"4 Hours"
  ];
   List phoneNumber =[
"Number",
"018193913**",
"018191488**",
"017394020**",
"013728294**",
"014820384**",
"016738392**",
"013849302**",
"017283947**",
"019273478**",
"015728383**",
"016738383**"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppColors.scaffold,
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomConatinerButton(),
         
         ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
          itemCount: userName.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(left: 5,right:5,top: 1),
            child: Container(
              height: 40,
                  width: width,
                  decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(10)),
                  child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Text( overflow: TextOverflow.ellipsis,maxLines:1,
                "${userName[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),),
            ),
             Expanded(
              flex: 2,
               child: Text(overflow: TextOverflow.ellipsis,maxLines:1,"${phoneNumber[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),),
             ),
        
               Expanded(
                flex: 1,
                 child: Text(overflow: TextOverflow.ellipsis,maxLines:1,"${balance[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14)),
               ),
                 Expanded( flex:1, child :Text(overflow: TextOverflow.ellipsis,maxLines:1,"${hours[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),))
                  ]),
            ),
          );
         }),
 ]),
      ),
 
    );
  }
}