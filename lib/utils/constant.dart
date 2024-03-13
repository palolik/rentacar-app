import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//SizedBoxes
const SizedBox widthSpace2 = SizedBox(width: 2);
const SizedBox widthSpace3 = SizedBox(width: 3);
const SizedBox widthSpace5 = SizedBox(width: 5);
const SizedBox widthSpace7 = SizedBox(width: 7);
const SizedBox widthSpace10 = SizedBox(width: 10);
const SizedBox widthSpace15 = SizedBox(width: 15);
const SizedBox widthSpace20 = SizedBox(width: 20);
const SizedBox widthSpace25 = SizedBox(width: 25);
const SizedBox widthSpace30 = SizedBox(width: 30);
const SizedBox widthSpace40 = SizedBox(width: 40);
const SizedBox widthSpace50 = SizedBox(width: 50);
const SizedBox widthSpace70 = SizedBox(width: 70);

const SizedBox heightSpace2 = SizedBox(height: 2);
const SizedBox heightSpace4 = SizedBox(height: 4);
const SizedBox heightSpace5 = SizedBox(height: 5);
const SizedBox heightSpace7 = SizedBox(height: 7);
const SizedBox heightSpace8 = SizedBox(height: 8);
const SizedBox heightSpace9 = SizedBox(height: 9);
const SizedBox heightSpace10 = SizedBox(height: 10);
const SizedBox heightSpace11 = SizedBox(height: 11);
const SizedBox heightSpace15 = SizedBox(height: 15);
const SizedBox heightSpace20 = SizedBox(height: 20);
const SizedBox heightSpace25 = SizedBox(height: 25);
const SizedBox heightSpace30 = SizedBox(height: 30);
const SizedBox heightSpace40 = SizedBox(height: 40);
const SizedBox heightSpace50 = SizedBox(height: 50);
const SizedBox heightSpace60 = SizedBox(height: 60);
const SizedBox heightSpace70 = SizedBox(height: 70);
const SizedBox heightSpace80 = SizedBox(height: 80);

//Colors
const Color transparent = Colors.transparent;
const Color black = Colors.black;
const Color white = Colors.white;
const Color amber = Colors.amber;
const Color primaryColor = Color.fromARGB(255, 8, 0, 77);
const Color colorE6 = Color(0xffE6E6E6);
const Color colorD2 = Color(0xffD2D2D2);
const Color bottomNavColor = Color.fromARGB(255, 56, 60, 120);
const Color scaffoldColor = Color(0xffF2F4F6);
const Color redTextColor = Color(0xffFF0000);
const Color color94 = Color(0xff949494);
const Color thirdColor = Color(0xffB7B7B7);
const Color dividerColor = Color(0xffE6E6E6);
Color colorForShadow = const Color(0xff000000).withOpacity(.25);
BoxShadow myBoxShadow = BoxShadow(blurRadius: 4, color: colorForShadow);
Border myBorder = Border.all(color: primaryColor);

//Images
const String logo = 'assets/images/Logo.png';
const String arrow = 'assets/images/arrow.svg';
//on_boarding_page
const String onBoarding1 = 'assets/images/on_boarding_images/on_boarding1.png';
const String onBoarding2 = 'assets/images/on_boarding_images/on_boarding2.png';

//login
const String email = 'assets/images/text_field_icons/email.png';
const String lock = 'assets/images/text_field_icons/lock.png';
//register
const String mobile = 'assets/images/text_field_icons/mobile.png';
const String person = 'assets/images/text_field_icons/person.png';
//social_icons
const String facebook = 'assets/images/social_icons_images/facebook.png';
const String google = 'assets/images/social_icons_images/google.png';
const String twitter = 'assets/images/social_icons_images/twitter.png';
//bottom_navigation_images
const String homeSvg = 'assets/images/bottom_navigation_svg/homeSvg.svg';
const String myBookingSvg =
    'assets/images/bottom_navigation_svg/myBookingSvg.svg';
const String profileSvg =
    'assets/images/bottom_navigation_svg/myProfileSvg.svg';
//home_page
const String carMain = 'assets/images/other_images/carMain.png';
const String calendar = 'assets/images/text_field_icons/calander.png';
const String car1 = 'assets/images/cars_images/car1.png';
const String car2 = 'assets/images/cars_images/car2.png';
const String car3 = 'assets/images/cars_images/car3.png';
const String car4 = 'assets/images/cars_images/car4.png';
const String car5 = 'assets/images/cars_images/car5.png';
const String carDetailMain = 'assets/images/cars_images/car_detail_main.png';
const String carDetailSide1 = 'assets/images/cars_images/car_detail_side1.png';
const String carDetailSide2 = 'assets/images/cars_images/car_detail_side2.png';
const String carDetailSide3 = 'assets/images/cars_images/car_detail_side3.png';
const String star = 'assets/images/other_images/Star.png';
const String latestOffer1 = 'assets/images/cars_images/latestOffer1.png';
const String latestOffer2 = 'assets/images/cars_images/latestOffer2.png';
const String latestOffer3 = 'assets/images/cars_images/latestOffer3.png';
const String seat = 'assets/images/other_images/seat.png';
const String petrol = 'assets/images/other_images/petrol.png';
const String auto = 'assets/images/other_images/auto.png';
const String filter = 'assets/images/other_images/filter.png';
const String sortBy = 'assets/images/other_images/sortBy.png';
const String brand1 = 'assets/images/other_images/brand1.png';
const String brand2 = 'assets/images/other_images/brand2.png';
const String brand3 = 'assets/images/other_images/brand3.png';
const String brand4 = 'assets/images/other_images/brand4.png';
const String brand5 = 'assets/images/other_images/brand5.png';
const String brand6 = 'assets/images/other_images/brand6.png';
const String bodyType1 = 'assets/images/other_images/bodyType1.png';
const String bodyType2 = 'assets/images/other_images/bodyType2.png';
const String bodyType3 = 'assets/images/other_images/bodyType3.png';
const String bodyType4 = 'assets/images/other_images/bodyType4.png';
const String bodyType5 = 'assets/images/other_images/bodyType5.png';
const String bodyType6 = 'assets/images/other_images/bodyType6.png';
const String bodyType7 = 'assets/images/other_images/bodyType7.png';
const String conditioner = 'assets/images/other_images/conditioner.png';
const String navigation = 'assets/images/other_images/navigation.png';
const String usbInput = 'assets/images/other_images/usb_input.png';
const String bluetooth = 'assets/images/other_images/bluetooth.png';
const String autoTemp = 'assets/images/other_images/auto_temp.png';
const String keyless = 'assets/images/other_images/keyless.png';
const String process1 = 'assets/images/other_images/process1.png';
const String process2 = 'assets/images/other_images/process2.png';
const String process3 = 'assets/images/other_images/process3.png';
const String location = 'assets/images/other_images/location.png';
const String identityCard = 'assets/images/other_images/identification.png';
const String primaryCalender = 'assets/images/other_images/primaryCalender.png';
const String paymentType1 = 'assets/images/other_images/paymentType1.png';
const String paymentType2 = 'assets/images/other_images/paymentType2.png';
const String paymentType3 = 'assets/images/other_images/paymentType3.png';
const String paymentType4 = 'assets/images/other_images/paymentType4.png';
const String paymentType5 = 'assets/images/other_images/paymentType5.png';
const String edit = 'assets/images/other_images/edit.png';
const String paymentSuccess = 'assets/images/other_images/paymentSuccess.png';
const String viewReceipt = 'assets/images/other_images/viewReceipt.png';
const String profilePic = 'assets/images/other_images/profilePic.png';
const String logoutIcon = 'assets/images/other_images/logoutIcon.png';
const String profile1 = 'assets/images/other_images/profile1.png';
const String profile2 = 'assets/images/other_images/profile2.png';
const String profile3 = 'assets/images/other_images/profile3.png';
const String profile4 = 'assets/images/other_images/profile4.png';
const String profile5 = 'assets/images/other_images/profile5.png';
const String profile6 = 'assets/images/other_images/profile6.png';
const String profile7 = 'assets/images/other_images/profile7.png';
const String camera = 'assets/images/other_images/camera.png';
const String gallery = 'assets/images/other_images/gallery.png';
const String bin = 'assets/images/other_images/bin.png';
const String noNotification = 'assets/images/other_images/noNotification.png';
const String savedHeart = 'assets/images/other_images/savedHeart.png';

//Text_Styles
TextStyle blackMedium18 = TextStyle(
  fontSize: 12.5.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle blackBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: black,
  fontFamily: 'B',
);
TextStyle whiteMedium18 = TextStyle(
  fontSize: 12.5.sp,
  color: white,
  fontFamily: 'M',
);
TextStyle blackMedium16 = TextStyle(
  fontSize: 11.2.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle blackRegular16 = TextStyle(
  fontSize: 11.2.sp,
  color: black,
  fontFamily: 'R',
);
TextStyle thirdMedium14 = TextStyle(
  fontSize: 10.sp,
  color: thirdColor,
  fontFamily: 'M',
);
TextStyle primaryMedium14 = TextStyle(
  fontSize: 10.sp,
  color: primaryColor,
  fontFamily: 'M',
);
TextStyle primaryMedium13 = TextStyle(
  fontSize: 9.5.sp,
  color: primaryColor,
  fontFamily: 'M',
);
TextStyle primaryMedium16 = TextStyle(
  fontSize: 11.sp,
  color: primaryColor,
  fontFamily: 'M',
);
TextStyle primaryBold16 = TextStyle(
  fontSize: 11.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle whiteMedium16 = TextStyle(
  fontSize: 11.sp,
  color: white,
  fontFamily: 'M',
);
TextStyle whiteMedium13 = TextStyle(
  fontSize: 9.5.sp,
  color: white,
  fontFamily: 'M',
);
TextStyle bottomUnselected16 = TextStyle(
  fontSize: 11.sp,
  color: const Color.fromARGB(255, 68, 56, 120),
  fontFamily: 'M',
);
TextStyle primaryRegular13 = TextStyle(
  fontSize: 9.5.sp,
  color: primaryColor,
  fontFamily: 'R',
);
TextStyle primaryBold13 = TextStyle(
  fontSize: 9.5.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle redRegular13 = TextStyle(
  fontSize: 9.5.sp,
  color: redTextColor,
  fontFamily: 'R',
);
TextStyle color94Medium14 = TextStyle(
  fontSize: 10.sp,
  color: color94,
  fontFamily: 'M',
);
TextStyle primaryBold14 = TextStyle(
  fontSize: 10.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle blackMedium14 = TextStyle(
  fontSize: 10.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle color94Regular14 = TextStyle(
  fontSize: 10.sp,
  color: color94,
  fontFamily: 'R',
);
TextStyle color94Regular15 = TextStyle(
  fontSize: 10.3.sp,
  color: color94,
  fontFamily: 'R',
);
TextStyle primaryRegular15 = TextStyle(
  fontSize: 10.3.sp,
  color: primaryColor,
  fontFamily: 'R',
);
TextStyle primaryMedium15 = TextStyle(
  fontSize: 10.3.sp,
  color: primaryColor,
  fontFamily: 'M',
);
TextStyle color94Regular12 = TextStyle(
  fontSize: 8.5.sp,
  color: color94,
  fontFamily: 'R',
);
TextStyle primaryMedium12 = TextStyle(
  fontSize: 8.5.sp,
  color: primaryColor,
  fontFamily: 'M',
);
TextStyle color94Regular13 = TextStyle(
  fontSize: 9.5.sp,
  color: color94,
  fontFamily: 'R',
);
TextStyle whiteRegular14 = TextStyle(
  fontSize: 10.sp,
  color: white,
  fontFamily: 'R',
);
TextStyle whiteRegular11 = TextStyle(
  fontSize: 10.sp,
  color: white,
  fontFamily: 'R',
);
TextStyle whiteRegular15 = TextStyle(
  fontSize: 10.3.sp,
  color: white,
  fontFamily: 'R',
);
TextStyle blackRegular15 = TextStyle(
  fontSize: 10.3.sp,
  color: black,
  fontFamily: 'R',
);
TextStyle color94Medium15 = TextStyle(
  fontSize: 10.3.sp,
  color: color94,
  fontFamily: 'M',
);
TextStyle color94Regular16 = TextStyle(
  fontSize: 11.sp,
  color: color94,
  fontFamily: 'R',
);
TextStyle primaryRegular16 = TextStyle(
  fontSize: 11.sp,
  color: primaryColor,
  fontFamily: 'R',
);
TextStyle color94Medium16 = TextStyle(
  fontSize: 11.sp,
  color: color94,
  fontFamily: 'M',
);
TextStyle blackRegular14 = TextStyle(
  fontSize: 10.sp,
  color: black,
  fontFamily: 'R',
);
TextStyle blackBold22 = TextStyle(
  fontSize: 15.5.sp,
  fontFamily: 'B',
  color: black,
);
TextStyle whiteBold11 = TextStyle(
  fontSize: 7.5.sp,
  fontFamily: 'B',
  color: white,
);
TextStyle whiteBold22 = TextStyle(
  fontSize: 15.5.sp,
  fontFamily: 'B',
  color: white,
);
TextStyle whiteBold18 = TextStyle(
  fontSize: 12.5.sp,
  fontFamily: 'B',
  color: white,
);
