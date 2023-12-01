import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/provider/admin.provider.dart';
import 'package:weather_app/screens/auth/login_screen.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AdminProvider>(context,listen: false).getListofRequest();
    super.initState();
  }
  TextEditingController bk = TextEditingController();
   TextEditingController nodog = TextEditingController();
      TextEditingController notification = TextEditingController();
      TextEditingController whatsApp = TextEditingController();
      TextEditingController paymentText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Consumer<AdminProvider>(
        builder: (context, adminProvider,child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              children: [

                ElevatedButton(onPressed: (){
                  Helper.toScreen(context, LoginScreen());
                }, child: Text("Go to login screen")),
                CustomTextField(
                  hintText: "Bkash nuber change",
                  controller: bk,
                ),
                ElevatedButton(onPressed: (){
                  adminProvider.updateBkash(bk.text);
                  
                    setState(() {});
                }, child: Text("Submit")),
                  CustomTextField(
                    controller: nodog,
                  hintText: "Nogod nuber change",
                ),
                   ElevatedButton(onPressed: (){
                    adminProvider.updateNagad(nodog.text);
                      setState(() {});
                   }, child: Text("Submit")),
                  CustomTextField(
                    controller:notification ,
                  hintText: "Notification",
                ),
                   ElevatedButton(onPressed: (){
                     adminProvider.updateNotification(notification.text);
                     setState(() {});
                   }, child: Text("Submit")),
                 CustomTextField(
                  hintText: "whats app",
                  controller: whatsApp,
                ),
                 ElevatedButton(onPressed: (){
                   adminProvider.updateWhatsApp(whatsApp.text);
                     setState(() {});
                 }, child: Text("Submit")),
                CustomTextField(
                  hintText: "Add payment text",
                  controller: paymentText,
                ),
                ElevatedButton(onPressed: (){
                  adminProvider.updateText(paymentText.text);
                  setState(() {});
                }, child: Text("Submit")),
                ListView.builder(
                  itemCount: adminProvider.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                  
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User name :${adminProvider.data[index]["username"]}",style: latoStyle700Bold.copyWith(fontSize: 10),),
                            SizedBox(height: 5,),
                             Text("userId :${adminProvider.data[index]["userId"]}",style: latoStyle700Bold.copyWith(fontSize: 10),),
                             SizedBox(height: 5,), Text("Transjctionid:${adminProvider.data[index]["Transjctionid"]}",style: latoStyle700Bold.copyWith(fontSize: 10),),
                              SizedBox(height: 5,), Text("phoneNumber :${adminProvider.data[index]["phoneNumber"]}",style: latoStyle700Bold.copyWith(fontSize: 10),),
                               SizedBox(height: 5,), Text("ammount :${adminProvider.data[index]["ammount"]}",style: latoStyle700Bold.copyWith(fontSize: 10),),
                                          Row(children: [
                             Expanded(
                               child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                onPressed: (){
                                  adminProvider.addblance(adminProvider.data[index]["userId"], adminProvider.data[index]["ammount"], index);
                              setState(() {
                                
                              });  }, child: Text("Acepted")),
                             ),
                             SizedBox(width: 10,),
                                 Expanded(
                                   child: ElevatedButton(
                                                           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                           onPressed: (){adminProvider.rejectRequest(index);
                                                             setState(() {});
                                
                              },
                                                            child: Text("Rejected")),
                                 )
                                          ],)
                          ],
                        ),
                      ),
                    ),
                  );
                }
                ),
                SizedBox(height: 500,),
              ],
              ),
            ),
          );
        }
      ),
    );
  }
}