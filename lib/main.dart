import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home/home_page.dart';

import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) =>runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<WeatherProvider>()),


    ],
    child: const MyApp(),
  ) )
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
          // theme: Provider.of<ThemeProvider>(context).darkTheme ? AppTheme.getDarkModeTheme() : AppTheme.getLightModeTheme(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
          home: child
      ); },
      child: const HomePageScreen(),
    );
  }
}