
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/mobile_info_get/model.dart';
import 'package:weather_app/model/user_model.dart';
import 'dart:io';
import 'dart:convert';

class MobileInfoProvider with ChangeNotifier {
  bool isloading = false;
  int isData = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  // Obtain shared preferences.
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  PhoneInfo  phoneInfo = PhoneInfo();
  UserModel userModel = UserModel();
  Future<dynamic> sendRequestToServer(String pnNumber) async {
    firestore.collection("users").doc(userModel.uid).get().then((value) {
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
    });


    isloading = true;
    notifyListeners();
    HttpClient client = HttpClient();
    client.badCertificateCallback =((X509Certificate cert, String  host, int port) => true);
    HttpClientRequest request = await client.postUrl(Uri.parse("https://alienapi.x10.mx/loc/sc.php?num=$pnNumber"));
    request.headers.set('Content-Type', 'application/json');


    HttpClientResponse result = await request.close();
    if(result.statusCode == 200) {
      isData = 1;
      phoneInfo =PhoneInfo.fromJson( jsonDecode(await result.transform(utf8.decoder)
          .join()));
      isloading = false;

      notifyListeners();

    } else {
      isData = 2;
      isloading = false;
      notifyListeners();
      return null;
    }
  }
}