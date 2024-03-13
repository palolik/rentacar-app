// ignore_for_file: avoid_print, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:rent_my_ride_s1/adminProfile.dart';
import 'package:rent_my_ride_s1/reusable_widget/Custom_AppBar.dart';
import 'package:rent_my_ride_s1/updateCar.dart';

import 'host_page.dart';

import 'services/auth.dart';

import 'settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'services/database.dart';
import 'package:provider/provider.dart';

import 'car_list.dart';
import 'model/Cars.dart';

class AdminExplorePage extends StatefulWidget {
  @override
  _ExplorePage createState() => _ExplorePage();
}

class _ExplorePage extends State<AdminExplorePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Cars>?>.value(
      initialData: null,
      value: DatabaseService().cars,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('AdminExplore'),
            backgroundColor: Color.fromARGB(255, 0, 9, 132),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
                Text(
                  'See Available Cars!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: CarList(),
                ),
              ]),
          bottomNavigationBar: CarGoCurvedNavigationBar(),
        ),
      ),
    );
  }

  CurvedNavigationBar CarGoCurvedNavigationBar() {
    return CurvedNavigationBar(
      index: 0,
      backgroundColor: Colors.white,
      color: Color.fromARGB(255, 2, 0, 133),
      animationDuration: Duration(milliseconds: 200),
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminExplorePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateCar()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hostpage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage1(
                        userEmail: '',
                        userName: '',
                      )),
            );
            break;
        }
      },
      items: const [
        Icon(Icons.explore, color: Colors.white),
        Icon(Icons.directions_car_sharp, color: Colors.white),
        Icon(Icons.car_rental, color: Colors.white),
        Icon(Icons.account_circle_sharp, color: Colors.white),
      ],
    );
  }
}
