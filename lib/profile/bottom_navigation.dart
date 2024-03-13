import 'package:rent_my_ride_s1/explore_page.dart';

import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BottomNavigation extends StatefulWidget {
  final int? index;
  const BottomNavigation({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  DateTime lastTimeBackbuttonWasClicked = DateTime.now();
  DateTime? currentBackPressTime;
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    //const MyBookingPage(),
    // ProfilePage(),
    //ProfilePage()
  ];

  @override
  void initState() {
    selectedIndex = widget.index ?? 0;
    super.initState();
  }

  /* Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: primaryColor,
        content: Text(
          'Press back again to exit',
          style: whiteRegular15,
        ),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  } */

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastTimeBackbuttonWasClicked) >=
            const Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              backgroundColor: primaryColor,
              content: Text(
                'Press back again to exit',
                style: whiteRegular15,
              ),
            ),
          );
          lastTimeBackbuttonWasClicked = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(homeSvg,
                      color: selectedIndex == 0 ? white : bottomNavColor),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(myBookingSvg,
                      color: selectedIndex == 1 ? white : bottomNavColor),
                ),
                label: 'My Booking'),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(profileSvg,
                      color: selectedIndex == 2 ? white : bottomNavColor),
                ),
                label: 'Profile'),
          ],
          onTap: (int index) {
            setState(() => selectedIndex = index);
          },
          currentIndex: selectedIndex,
          selectedItemColor: white,
          unselectedItemColor: const Color.fromARGB(255, 57, 56, 120),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: whiteMedium16,
          unselectedLabelStyle: bottomUnselected16,
        ),
        body: _widgetOptions.elementAt(selectedIndex),
      ),
    );
  }
}