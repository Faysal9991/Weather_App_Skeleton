import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/model/auto_complete_model.dart';
import 'package:weather_app/data/model/response/base/api_response.dart';
import 'package:weather_app/data/model/response/search_weather_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class WeatherProvider with ChangeNotifier{
  final WeatherRepo weatherRepo;
  WeatherProvider({required this.weatherRepo});
  bool isLoading = false;
  late SharedPreferences? sharedPreferences;


  //TODO:get SearchResult
  SearchModel searchModel = SearchModel();

  Future searchResult(String location,Function callback) async {
    ApiResponse response = await weatherRepo.getSearchResult(location);

    if (response.response.statusCode == 200) {
      response.response.data.forEach((element) {
        searchModel = SearchModel.fromJson(element);

      });

      callback(true, response.response.statusMessage);
    } else {

      callback(false, response.response.statusMessage);
    }
    notifyListeners();
  }
  bool autoCom = true;
  AutoCompleteModel autoCompleteModel = AutoCompleteModel();
  Future autoCompleteWeather(double lat ,double lon,Function callback) async {
    ApiResponse response = await weatherRepo.getAdressName(lat,lon);
    autoCom = true;
    if (response.response.statusCode == 200) {

        autoCompleteModel = AutoCompleteModel.fromJson(response.response.data);
        autoCom = false;
    } else {
      autoCom = true;
    }
    notifyListeners();
  }


  PermissionStatus _locationStatus = PermissionStatus.denied;
  Position? currentPosition;

  Future<PermissionStatus> getLocationStatus() async {
    // Request for permission
    final status = await Permission.location.request();
    // change the location status
    _locationStatus = status;
    // notiy listeners
    notifyListeners();
    print(_locationStatus);
    return status;
  }

  double latitude= 0;
  double longitude=0;
  getLocation(Function callback) async {
    // Call Location status function here

    isLoading = true;
    final status = await getLocationStatus();
    print("I am insdie get location");
    // if permission is granted or limited call function
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.limited) {
      try {

        Position p= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        currentPosition=p;
        latitude= p.latitude;
        longitude=p.longitude;
         callback(true);
        isLoading = false;
        notifyListeners();
      } catch (e) {
        // incase of error location witll be null
        currentPosition = null;
        rethrow;
      }
    }else{
      isLoading = true;
      callback(false);
    }

   notifyListeners();
  }

}