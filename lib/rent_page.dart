// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

// import 'dart:html';

import 'package:rent_my_ride_s1/profile/profile_page.dart';

import 'reusable_widget/Custom_AppBar.dart';
import 'history_page.dart';
import 'explore_page.dart';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'booked_page.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CarGoAppBar(),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color.fromARGB(255, 0, 0, 126),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      color: Color.fromARGB(255, 4, 0, 131),
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Rent"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Booked"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("History"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    Center(),
                    BookedPage(),
                    HistoryPage(),
                  ]),
                )
              ]),
            ),
          ),
          bottomNavigationBar: CarGoCurvedNavigationBar(),
        ));
  }

  CurvedNavigationBar CarGoCurvedNavigationBar() {
    return CurvedNavigationBar(
      index: 1,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      color: Color.fromARGB(255, 0, 0, 129),
      animationDuration: Duration(milliseconds: 200),
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExplorePage()),
            );
            break;

          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            break;
        }
      },
      items: const [
        Icon(Icons.explore, color: Colors.white),
        Icon(Icons.car_rental, color: Colors.white),
        Icon(Icons.account_circle_sharp, color: Colors.white),
      ],
    );
  }

  // AppBar CarGoAppBar() {
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: Colors.transparent,
  //     shadowColor: Colors.transparent,
  //     iconTheme: IconThemeData(color: Colors.black),
  //     centerTitle: true,
  //     title: Padding(
  //       padding: const EdgeInsets.only(top: 7),
  //       child: Image.asset(
  //         'assets/logo.jpg',
  //         color: Colors.black,
  //         height: 120.0,
  //         width: 90.0,
  //       ),
  //     ),
  //   );
  // }
}
