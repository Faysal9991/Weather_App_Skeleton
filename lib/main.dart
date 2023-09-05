import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/screens/auth/login_screen.dart';
import 'package:weather_app/util/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) =>runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),

    ],
    child:  MyApp(),
    ))
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child)
      { return MaterialApp(
          title: 'Help Adobe',
           theme:AppTheme.getLightModeTheme(),
          debugShowCheckedModeBanner: false,
         builder: EasyLoading.init(),
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
          home: child
      ); },
      child: const LoginScreen(),
    );
  }
}