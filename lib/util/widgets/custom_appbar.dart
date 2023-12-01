import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/mobile_info_get/mobile_info.dart';
import 'package:weather_app/provider/admin.provider.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/screens/auth/login_screen.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';
import 'package:badges/badges.dart' as badges;
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

// ignore: must_be_immutable
class CustomConatinerButton extends StatefulWidget {
  

  const CustomConatinerButton({

    Key? key,
  }) : super(key: key);

  @override
  State<CustomConatinerButton> createState() => _CustomConatinerButtonState();
}

class _CustomConatinerButtonState extends State<CustomConatinerButton> {
  @override
  void initState() {
    // TODO: implement initState
   
    Provider.of<AuthProvider>(context,listen: false).getUserDetails();
        Provider.of<AdminProvider>(context,listen: false).getnotification();
 Provider.of<AdminProvider>(context,listen: false).getBkashNogodNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
    return Consumer2<AuthProvider,AdminProvider>(
      builder: (context, authProvider,adminProvider,child) {
        return authProvider.isLoading?Container(
          height: height/3,
          width: width,
          decoration:  BoxDecoration(
              color: Colors.pink,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),boxShadow: Helper.softUiShadow
             ),
          child: CupertinoActivityIndicator()): Container(
         
          width: width,
          decoration:  BoxDecoration(
              color: Colors.pink,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),boxShadow: Helper.softUiShadow
             ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(children: [
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            const Spacer(),
              InkWell(
                onTap: (){
                  var whatsappUrl ="whatsapp://send?phone=${adminProvider.whatsApp}";
                  launchUrl(Uri.parse(whatsappUrl));
                },
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.scaffold),
                    child:  Center(child:FaIcon(FontAwesomeIcons.whatsapp,color:Colors.pink,size: 20,),)),
              ),
SizedBox(width: 5,),
       adminProvider.notification!["is"]?  InkWell(
            onTap: (){
 showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
    
    content: Text(adminProvider.notification!["notification"]!=null?"${adminProvider.notification!["notification"]}":"0"),
    actions: [
   
    ],
  );
     
         } );
            },
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.scaffold),
             child:  Center(child:
             badges.Badge(
                badgeContent: Text('1',style: latoStyle300Light.copyWith(color: Colors.white),),
                child:  FaIcon(FontAwesomeIcons.solidBell,color:Colors.pink,size: 20,),
              )
             
             ),),
          ):Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.scaffold),
           child:  Center(child:FaIcon(FontAwesomeIcons.solidBell,color:Colors.pink,size: 20,),))
          
            ]),
            
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
                         
                          text: '${authProvider.userModel.username}',
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
                         
                          text: '${authProvider.userModel.email}',
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
                         
                          text: '${authProvider.userModel.phoneNumber}',
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
                             
                              text: ' \$${authProvider.userModel.balance}',
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: (){
                          Provider.of<MobileInfoProvider>(context,listen: false).isData =0;
                      authProvider.logout();
Helper.toRemoveUntilScreen(context, LoginScreen());
                    }, child: Text("logout",style: latoStyle800ExtraBold,))
                  ],
                ),
              ],
            )
            ]),
          ),
        );
      }
    );
  }
}
