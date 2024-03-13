// ignore_for_file: file_names

import 'package:rent_my_ride_s1/explore_page.dart';
import 'package:rent_my_ride_s1/on_boarding_page.dart';

import 'authenticate/login_page.dart';
import 'reusable_widget/Custom_AppBar.dart';
import 'package:flutter/material.dart';

class VerifySuccessful extends StatelessWidget {
  const VerifySuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/congoo.png",
                        width: 120,
                        height: 120,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Login Successfull",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Welcome Admin",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Color.fromARGB(255, 104, 127, 255),
              ),
              child: TextButton(
                  style: TextButton.styleFrom(fixedSize: const Size(180, 50)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, a, b) => ExplorePage()),
                        (route) => false);
                  },
                  child: const Text(
                    " Manage Rent My Ride App",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
