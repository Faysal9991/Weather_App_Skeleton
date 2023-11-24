import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/provider/admin.provider.dart';
import 'package:weather_app/provider/authprovider.dart';
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
    List otp =[
      "NID to number",
      "Number to NID",
"নগদ NID তথ্য",
"বিকাশ NID তথ্য"

];
 List money =[
"200 Taka",
"300 Taka",
"1400 Taka",
"1420 Taka"
  ];
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
                         
             ListView.builder(
               padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap:  true,
              itemCount: money.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  height: 40,
                      width: width,
                      decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(10)),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text("${otp[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),),
                             Text("${money[index]}",style: latoStyle700Bold.copyWith(color: Colors.white,fontSize: 14),)
                      ]),
                            ),
                );
              }),
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
                  child: CustomTextField(borderRadius: 30,fillColor: Colors.white,isShowBorder: true,verticalSize: 15,horizontalSize: 20,hintText: "Enter Number",controller: ammount,)),
          
                   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
             child: SizedBox(
            width: width,
            child: ElevatedButton(onPressed: (){
          auth.userModel.balance=="0"?EasyLoading.showError("You don't have enough balance"):EasyLoading.showError("Server is busy try agin or upgrade your package");
            
            }, child: const Text("Send otp"))),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      height: 100,
                      width: width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: Colors.black)),
                     child: Center(child: Text("After send otp details come in this box",style: latoStyle700Bold.copyWith(fontSize: 10),)),),
                   ),
                   SizedBox(height: 100,)
                 ]),
          );
        }
      ),
 
    );
  }
}