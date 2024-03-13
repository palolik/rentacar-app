import 'package:rent_my_ride_s1/helpers/ui_helper.dart';
import 'package:rent_my_ride_s1/profile/bottom_navigation.dart';
import 'package:rent_my_ride_s1/utils/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? _currentUser;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _userDataStream;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    FirebaseAuth auth = FirebaseAuth.instance;
    _currentUser = auth.currentUser;
    _userDataStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              heightSpace20,
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: _userDataStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) {
                    return const Text('User data not found.');
                  }
                  var userData = snapshot.data!.data();
                  return profileDetail(context, userData);
                },
              ),
              heightSpace20,
              scrollableTapableItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileDetail(BuildContext context, Map<String, dynamic>? userData) {
    return MyContainerWithChild(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: colorD2,
          ),
          widthSpace10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userData?['name'] ?? 'Name', style: blackMedium16),
                heightSpace2,
                Text(userData?['email'] ?? 'Email', style: color94Regular14),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              UiHelper.showLogOutDialog(context);
            },
            child: Row(
              children: [
                SizedBox(
                  height: 2.h,
                  width: 2.h,
                  child: Image.asset(logoutIcon),
                ),
                widthSpace7,
                Text('Logout', style: primaryMedium14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      centerTitle: true,
      backgroundColor: white,
      elevation: 0,
      title: Text('Profile', style: blackBold18),
    );
  }
}

Widget scrollableTapableItems() {
  List items = [
    {'icon': profile2, 'title': 'My Profile', 'navigate': '/EditProfilePage'},
    {
      'icon': profile6,
      'title': 'Terms & Conditions',
      'navigate': '/TermsAndConditionPage'
    },
    {'icon': profile7, 'title': 'FAQs', 'navigate': '/FAQPage'},
  ];
  return MyContainerWithChild(
    child: Column(
      children: [
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var e = items[index];
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(top: 10)
                  : index == items.length - 1
                      ? const EdgeInsets.only(bottom: 10)
                      : EdgeInsets.zero,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                onTap: () {
                  if (index == 0) {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const BottomNavigation(index: 1),
                        isIos: true,
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, e['navigate']);
                  }
                },
                leading: SizedBox(
                  height: 2.3.h,
                  width: 2.3.h,
                  child: Image.asset(e['icon']),
                ),
                title: Transform.translate(
                  offset: const Offset(-12.2, 0),
                  child: Text(e['title'], style: blackRegular16),
                ),
                trailing:
                    const Icon(Icons.chevron_right_outlined, color: black),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: colorE6,
              ),
            );
          },
          itemCount: items.length,
        ),
      ],
    ),
  );
}

Widget profileDetail(BuildContext context, Map<String, dynamic>? userData) {
  return MyContainerWithChild(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: colorD2,
          backgroundImage: AssetImage(profilePic),
        ),
        widthSpace10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userData?['name'] ?? 'Name', style: blackMedium16),
              heightSpace2,
              Text(userData?['email'] ?? 'Email', style: color94Regular14),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            UiHelper.showLogOutDialog(context);
          },
          child: Row(
            children: [
              SizedBox(
                height: 2.h,
                width: 2.h,
                child: Image.asset(logoutIcon),
              ),
              widthSpace7,
              Text('Logout', style: primaryMedium14),
            ],
          ),
        ),
      ],
    ),
  );
}

AppBar appBarMethod() {
  return AppBar(
    centerTitle: true,
    backgroundColor: white,
    elevation: 0,
    title: Text('Profile', style: blackBold18),
  );
}
