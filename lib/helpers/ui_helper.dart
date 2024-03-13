import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/constant.dart';

class UiHelper {
  static void showLogOutDialog(
    BuildContext context,
  ) {
    AlertDialog logoutDialog = AlertDialog(
      backgroundColor: scaffoldColor,
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(top: 30, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      // title: Container(
      //     alignment: Alignment.center,
      //     width: 80.w,
      //     height: 50,
      //     decoration: const BoxDecoration(
      //         color: primaryColor,
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(8),
      //           topRight: Radius.circular(8),
      //         )),
      //     child: Text(
      //       'Logout',
      //       style: whiteBold18,
      //     )),
      content: SizedBox(
        width: 80.w,
        child: Text(
      'Are you sure want to logout?',
      style: blackMedium16,
      textAlign: TextAlign.center,
      maxLines: 2,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10.5),
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(5))),
                  child: Text('Cancel', style: whiteMedium16),
                ),
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, '/LoginPage');
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10.5),
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(5))),
                  child: Text('Logout', style: whiteMedium16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) => logoutDialog);
  }

  static void showLoadingDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: primaryColor),
                heightSpace30,
                Text(
                  title,
                  style: color94Regular16,
                ),
              ],
            )),
      ),
    );
  }
}
