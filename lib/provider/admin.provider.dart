

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/user_model.dart';

class AdminProvider with ChangeNotifier{
 
      FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot? number;
    String whatsApp="";
      Map? notification;
     bool isLoading = false;
getBkashNogodNumber()async{
  isLoading =  true;
  number = await firestore.collection("admin").doc("number").get();
 whatsApp =number!["whatsApp"];
 isLoading = false;
 notifyListeners();
}
getnotification()async{
    isLoading =  true;
  DocumentSnapshot value = await firestore.collection("admin").doc("alart").get();
     notification = (value.data() as Map<String, dynamic>);
  
    isLoading = false;
    notifyListeners();
}
List data = [];
getListofRequest()async{
  data.clear();
  data =[];
 DocumentSnapshot listofData = await firestore.collection("admin").doc("user").get();
try{
   data = listofData["request"];
  
}
catch(e){
  print(e);
}
   notifyListeners();
}
  
  sendMoneyRequest(String username,String ammount,String phoneNumber,String Transjctionid)async{
           final SharedPreferences prefs = await SharedPreferences.getInstance();
         var  userId = prefs.getString("userId");
          Map request = {
    "username":username,
    "userId":userId,
    "ammount":ammount,
    "phoneNumber":phoneNumber,
    "Transjctionid":Transjctionid
  };
          
         data.add(request);
 
    try{  firestore.collection("admin").doc("user").set({"request": data});}on FirebaseException catch(error){
      print("error");
    }
     EasyLoading.showSuccess("submit done wait for admin confirmation");
   notifyListeners();
  }


rejectRequest(int index)async{
data.removeAt(index);
firestore.collection("admin").doc("user").set({"request": data});
 EasyLoading.showSuccess("submit done");
notifyListeners();
}

addblance(String UserId,String  ammount,int Index){
  
firestore.collection("users").doc(UserId).update({"balance": ammount});
data.removeAt(Index);
firestore.collection("admin").doc("user").set({"request": data});
 EasyLoading.showSuccess("submit done");
notifyListeners();
}

      UserModel userModel = UserModel();
     Future requestCutBalance(String UserId,)async{
        await firestore.collection("users").doc(UserId).get().then((value) {
          userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);

          int initialblance = int.parse(userModel.balance!);
          int newBanlace = initialblance - 200;
          firestore.collection("users").doc(UserId).update(
              {"balance": newBanlace.toString()});
          EasyLoading.showSuccess("submit done");
          notifyListeners();
        });




      }



updateBkash(String bkash){
  
  isLoading =  true;
    firestore.collection("admin").doc("number").update({"bkash":bkash});
 EasyLoading.showSuccess("submit done");
 isLoading = false;
 notifyListeners();
}
updateNagad(String Nagod){
  
  isLoading =  true;
    firestore.collection("admin").doc("number").update({"nogod":Nagod});
  EasyLoading.showSuccess("submit done");
 isLoading = false;
 notifyListeners();
}
updateWhatsApp(String whatsapp){
  
  isLoading =  true;
    firestore.collection("admin").doc("number").update({"whatsApp":whatsapp});
  EasyLoading.showSuccess("submit done");
 isLoading = false;
 notifyListeners();
}
updateNotification(String notification){
  
  isLoading =  true;
  if(notification.isEmpty){
    firestore.collection("admin").doc("alart").update({"is":false});
     EasyLoading.showSuccess("submit done");
  }else{
    firestore.collection("admin").doc("alart").update({"is":true});
    firestore.collection("admin").doc("alart").update({"notification":notification});
     EasyLoading.showSuccess("submit done");
  }
    
 
 isLoading = false;
 notifyListeners();
}
}





