import 'package:flutter/material.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';
import 'package:weather_app/util/widgets/custom_appbar.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
    String dropdownvalue = '200 BDT';   
  
  // List of items in our dropdown menu
  var items = [    
    '200 BDT',
    '400 BDT',
    '500 BDT', 
    '1000 BDT',
    '1500 BDT',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppColors.scaffold,
      body: Column(children: [
        CustomConatinerButton(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Container(height: 150,
          width: width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.lightBlue),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Text.rich(
                textAlign : TextAlign.center,
                      TextSpan(
                        text: 'You can rechargea with bkash : ',
                        style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 12),
                      
                        children: [
                   
                          TextSpan(
                            text: '01364585859',
                            style: latoStyle400Regular.copyWith(fontSize: 12,color:Colors.black,fontWeight: FontWeight.bold),
                          )],)
                     ),
                     Divider(),
                     Text(textAlign:TextAlign.justify,
                      "After sending  money, you will receive ammount in your blances,for your kind information please send us your sending number and also transction Id for verifying",style: latoStyle500Medium.copyWith(color: Colors.white),)
             ],
           ),
         ),)),
         Container(
          width: width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
           child: Center(
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                Text("your selected ammount : ",style: latoStyle600SemiBold,),
                 DropdownButton(
                        
                      // Initial Value
                      value: dropdownvalue,
                        
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),    
                        
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items,style: latoStyle600SemiBold.copyWith(color: Colors.green),),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) { 
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
               ],
             ),
           ),
         ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Enter your phone number",)),
              const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Enter transcaction id",)),
   Padding(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
     child: SizedBox(
      width: width,
      child: ElevatedButton(onPressed: (){}, child: Text("Send Information"))),
   )
 ]),
 
    );
  }
}