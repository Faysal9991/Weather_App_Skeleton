
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/user_model.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
 // Obtain shared preferences.
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel userModel = UserModel();
  dynamic profile;
   bool isLogin = false;
   bool isLoading = false;
   dynamic response;
    String?  userId;
    Future <bool> signUp(
      {required String email,
      required String password,
      required String username,
      required String phoneNumber}) async {
       // Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: "Creating Profile");
    try{
     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'createdAt': Timestamp.now(),
         'uid':userCredential.user!.uid,
          "balance": "0",
          "isLogin": "true"
      });
      userId = userCredential.user!.uid;
     prefs.setString("userId", userCredential.user!.uid);
        EasyLoading.showSuccess("Successful");
     return true;
    
    }on FirebaseException catch (e){
 EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
      return false;
    }
    }

   DocumentSnapshot? userDetails ;

    Future <bool>signIn(String email,String password)async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      EasyLoading.show(status: "Logging In");
      try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
     
        userId = userCredential.user!.uid;
       prefs .setString("userId", userCredential.user!.uid);

      await firestore.collection("users").doc(userId).get().then((value){

            userModel = UserModel.fromJson(value.data() as Map<String,dynamic>);
      });
        EasyLoading.showSuccess("Successful");

        return true;
      }on FirebaseException catch (e){
        EasyLoading.dismiss();
        EasyLoading.showError(e.toString());
        return false;
      }
    }


getUserDetails()async{
  isLoading = true;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString("userId")!;
await firestore.collection("users").doc(id).get().then((value){ userModel = UserModel.fromJson(value.data() as Map<String,dynamic>);

 isLoading = false;
    notifyListeners();
      });
}
 Future <bool> getLoginAccess()async{
     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(
 sharedPreferences.get("userId")!= null
  ){
    return true;
  }else{
    return false;
  }
 }
 logout()async{
   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("userId");
 }
}