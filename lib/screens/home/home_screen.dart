import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/mobile_info_get/mobile_info.dart';
import 'package:weather_app/provider/admin.provider.dart';
import 'package:weather_app/provider/authprovider.dart';
import 'package:weather_app/screens/home/views/diposit_Screen.dart';
import 'package:weather_app/screens/home/views/hestory.dart';
import 'package:weather_app/screens/home/views/otp.dart';
import 'package:weather_app/screens/home/views/send_money.dart';
import 'package:weather_app/screens/home/views/sms_screen.dart';
import 'package:weather_app/util/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    void initState() {
    // TODO: implement initState
      WidgetsBinding.instance.addPostFrameCallback((_){

        // Add Your Code here.
        Provider.of<MobileInfoProvider>(context,listen: false).isData =0;
        Provider.of<AuthProvider>(context,listen: false).getUserDetails();
        Provider.of<AdminProvider>(context,listen: false).getnotification();

      });



    super.initState();
  }
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 2;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const SmsScreen(),
    const SendMoneyScreen(),
 
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: true,
                notchColor: Colors.pink,
    
                /// restart app if you change removeMargins
                removeMargins: true,
                bottomBarWidth: 200,
                durationInMilliSeconds: 300,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    itemLabel: 'Page 1',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.manage_accounts,
                       color: Colors.black,
                    ),
                    activeItem: Icon(
                      Icons.manage_accounts,
                      color: Colors.white,
                    ),
                    itemLabel: 'Page 2',
                  ),


               ],
                onTap: (index) {
                  /// perform action on tab change and to update pages you can update pages without pages
                  log('current selected index $index');
                  _pageController.jumpToPage(index);
                },
              )
            : null,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.scaffold, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}