import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace20,
            Text('We’re Happy to hear from you !', style: blackMedium16),
            Text('Let us know your queries and feedbacks',
                style: color94Regular13),
            heightSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 11),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(blurRadius: 4, color: primaryColor)
                      ]),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.call,
                        color: white,
                      ),
                      widthSpace20,
                      Text('Call us', style: whiteMedium16)
                    ],
                  ),
                ),
                widthSpace20,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 11),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor),
                      boxShadow: [myBoxShadow]),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: primaryColor,
                      ),
                      widthSpace20,
                      Text('Mail us', style: primaryMedium16)
                    ],
                  ),
                )
              ],
            ),
            heightSpace20,
            const Divider(thickness: 1, color: colorD2),
            heightSpace15,
            Text('Or Send your message', style: blackMedium16),
            heightSpace15,
            MyContainerWithChild(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                cursorColor: primaryColor,
                style: color94Regular14,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Full Name',
                  hintStyle: color94Regular14,
                ),
              ),
            ),
            heightSpace10,
            MyContainerWithChild(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                cursorColor: primaryColor,
                style: color94Regular14,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: color94Regular14,
                ),
              ),
            ),
            heightSpace10,
            MyContainerWithChild(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                cursorColor: primaryColor,
                style: color94Regular14,
                maxLines: 8,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Message',
                  hintStyle: color94Regular14,
                ),
              ),
            ),
            heightSpace20,
            PrimaryButton(
              title: 'Submit',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      )),
    );
  }

  PreferredSize appBarMethod() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(title: 'Support'),
    );
  }
}
