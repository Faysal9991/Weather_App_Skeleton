import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/mobile_info_get/mobile_info.dart';
import 'package:weather_app/provider/admin.provider.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/util/custom_text_field.dart';
import 'package:weather_app/util/theme/app_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';
import 'package:weather_app/util/widgets/custom_appbar.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({super.key});

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  TextEditingController pnone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SingleChildScrollView(
        child: Consumer3<MobileInfoProvider, AuthProvider, AdminProvider>(
            builder: (context, mobile, auth, admin, child) {
          return mobile.isloading
              ? Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Center(
                      child: const CupertinoActivityIndicator(
                    color: Colors.pink,
                  )),
                )
              : Column(



                  children: [

                    const CustomConatinerButton(),
                    CarouselSlider(
                        items: [
                          Card(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(admin.notification!["notification"]!=null?"${admin.notification!["notification"]}":"0",style: latoStyle700Bold,),
                            ),)



                        ],
                        options: CarouselOptions(
                          height: 230,
                          aspectRatio: 16/9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: mobile.isData == 1
                              ? InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                            text:
                                                "NUMBER:${mobile.phoneInfo.number},Division: ${mobile.phoneInfo.division},District:${mobile.phoneInfo.district},Thana:${mobile.phoneInfo.thana},Union:${mobile.phoneInfo.union},Sector:${mobile.phoneInfo.sector},Owner:${mobile.phoneInfo.owner},Lat:${mobile.phoneInfo.lat},Lon:${mobile.phoneInfo.lon},Map:${mobile.phoneInfo.map}"))
                                        .then((_) {
                                      EasyLoading.showSuccess(
                                          "Successfully Copied to clipboard");
                                    });
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "NUMBER: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                mobile.phoneInfo.number != null
                                                    ? "${mobile.phoneInfo.number}"
                                                    : "Sorry Try again",
                                                style:
                                                    latoStyle700Bold.copyWith(
                                                        color: Colors.pink),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Division: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                mobile.phoneInfo.division !=
                                                        null
                                                    ? "${mobile.phoneInfo.division}"
                                                    : "Sorry Try again",
                                                style:
                                                    latoStyle700Bold.copyWith(
                                                        color: Colors.pink),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "District: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                mobile.phoneInfo.district !=
                                                        null
                                                    ? "${mobile.phoneInfo.district}"
                                                    : "Sorry Try again",
                                                style:
                                                    latoStyle700Bold.copyWith(
                                                        color: Colors.pink),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Thana: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                  mobile.phoneInfo.thana != null
                                                      ? "${mobile.phoneInfo.thana}"
                                                      : "Sorry Try again",
                                                  style:
                                                      latoStyle700Bold.copyWith(
                                                          color: Colors.pink)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Union: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                  mobile.phoneInfo.union != null
                                                      ? "${mobile.phoneInfo.union}"
                                                      : "Sorry Try again",
                                                  style:
                                                      latoStyle700Bold.copyWith(
                                                          color: Colors.pink)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Sector: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                  mobile.phoneInfo.sector !=
                                                          null
                                                      ? "${mobile.phoneInfo.sector}"
                                                      : "Sorry Try again",
                                                  style:
                                                      latoStyle700Bold.copyWith(
                                                          color: Colors.pink)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Owner: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                  mobile.phoneInfo.owner != null
                                                      ? "${mobile.phoneInfo.owner}"
                                                      : "Sorry Try again",
                                                  style:
                                                      latoStyle700Bold.copyWith(
                                                          color: Colors.pink)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Lat: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                  mobile.phoneInfo.lat != null
                                                      ? "${mobile.phoneInfo.lat}"
                                                      : "Sorry Try again",
                                                  style:
                                                      latoStyle700Bold.copyWith(
                                                          color: Colors.pink)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "lon: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                mobile.phoneInfo.lon != null
                                                    ? "${mobile.phoneInfo.lon}"
                                                    : "Sorry Try again",
                                                style:
                                                    latoStyle700Bold.copyWith(
                                                        color: Colors.pink),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Map: ",
                                                style: latoStyle700Bold,
                                              ),
                                              Text(
                                                mobile.phoneInfo.map != null
                                                    ? "${mobile.phoneInfo.map}"
                                                    : "Sorry Try again",
                                                style:
                                                latoStyle700Bold.copyWith(
                                                    color: Colors.pink),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink()),
                    ),
                    Text(
                      "please input number first to get location",
                      style: latoStyle800ExtraBold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: CustomTextField(
                          inputType: TextInputType.number,
                          controller: pnone,
                          borderRadius: 30,
                          fillColor: Colors.white,
                          isShowBorder: true,
                          verticalSize: 15,
                          horizontalSize: 20,
                          hintText: "Phone number",
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer<AuthProvider>(builder: (context, auth, child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                            width: width,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (auth.userModel.balance == "0") {
                                    EasyLoading.showError("Your balance is 0");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Insufficient balance"),
                                    ));
                                  } else if (double.parse(
                                          auth.userModel.balance.toString()) <=
                                      199) {
                                    EasyLoading.showError(
                                        "Insufficient balance");
                                  } else {
                                    admin
                                        .requestCutBalance(
                                            auth.userModel.uid.toString())
                                        .then((value) {
                                      mobile.sendRequestToServer(pnone.text);
                                    });
                                  }
                                },
                                child: const Text("Get location"))),
                      );
                    }),
                    const SizedBox(
                      height: 400,
                    )
                  ],
                );
        }),
      ),
    );
  }
}
