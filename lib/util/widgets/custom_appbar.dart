import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';


// ignore: must_be_immutable
class CustomConatinerButton extends StatelessWidget {
  

  const CustomConatinerButton({

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/3,
      width: width,
      decoration:  BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),boxShadow: Helper.softUiShadow
         ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(children: [
       Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.lightBlueAccent,
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child:Icon(Icons.person,size: 50,color: Colors.lightBlue,),
            ),
        ),
        const Spacer(),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.scaffold),
       child: const Center(child: FaIcon(FontAwesomeIcons.squareWhatsapp,color:Colors.green,size: 30,)),),
       const SizedBox(width: 10,),
       Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.scaffold),
       child: const Center(child: FaIcon(FontAwesomeIcons.solidBell,color:Colors.lightBlue,size: 20,)),),
       
       ],),
       const SizedBox(height: 20,),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                TextSpan(
                  text: 'User name : ',
                  style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 16),
                
                  children: [
      
                    TextSpan(
                     
                      text: 'Faysal',
                      style: latoStyle400Regular.copyWith(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold),
                    )
                  ]
                )
              ),
               Text.rich(
                TextSpan(
                  text: 'Gmail : ',
                  style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 16),
                
                  children: [
      
                    TextSpan(
                     
                      text: 'Faysal@gmail.com',
                      style: latoStyle400Regular.copyWith(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold),
                    )
                  ]
                )
              ),
                Text.rich(
                TextSpan(
                  text: 'phone number : ',
                  style: latoStyle400Regular.copyWith(color: Colors.white,fontSize: 16),
                
                  children: [
      
                    TextSpan(
                     
                      text: '01364585859',
                      style: latoStyle400Regular.copyWith(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold),
                    )
                  ]
                )
              ),
const SizedBox(height: 10,),
              Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),   color: Colors.white,),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                   
                    TextSpan(
                    
                      text: 'Balance :',
                      style: latoStyle700Bold.copyWith(color: Colors.black,fontSize: 16),
                    
                      children: [
                      
                        TextSpan(
                         
                          text: ' \$0',
                          style: latoStyle400Regular.copyWith(fontSize: 16,color:Colors.green,fontWeight: FontWeight.bold),
                          children: [
                                     TextSpan(
                         
                          text: ' BDT',
                          style: latoStyle400Regular.copyWith(fontSize: 16,color:Colors.green,fontWeight: FontWeight.bold),)
                          ]
                        )
                      ]
                    )
                  ),
                ),
              ),
              
              ],
            ),
          ],
        )
        ]),
      ),
    );
  }
}
