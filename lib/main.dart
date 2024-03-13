import 'package:rent_my_ride_s1/adminExplore.dart';
import 'package:rent_my_ride_s1/adminLogin.dart';
import 'package:rent_my_ride_s1/authenticate/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_my_ride_s1/booked_page.dart';
import 'package:rent_my_ride_s1/profile/edit_profile/edit_profile_page.dart';
import 'package:rent_my_ride_s1/profile/faq/f_a_q_page.dart';
import 'package:rent_my_ride_s1/profile/profile_page.dart';
import 'package:rent_my_ride_s1/profile/support/support_page.dart';
import 'package:rent_my_ride_s1/profile/terms_and_condition/terms_and_condition_page.dart';
import 'package:rent_my_ride_s1/profilePage.dart';
import 'bookingConfirmationPage.dart';

import 'firebase_options.dart';
import 'package:rent_my_ride_s1/explore_page.dart';
import 'package:rent_my_ride_s1/authenticate/register_page.dart';

import 'package:rent_my_ride_s1/on_boarding_page.dart';

import 'package:rent_my_ride_s1/splash_page.dart';
import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import 'model/Cars.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "RentMyRide", options: DefaultFirebaseOptions.currentPlatform);

  CarGoPhoneSystemActionBar();
  runApp(const Home());
}

// ignore: non_constant_identifier_names
void CarGoPhoneSystemActionBar() {}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: scaffoldColor,
            ),
            initialRoute: '/SplashPage',
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/SplashPage':
                  return PageTransition(
                    child: const SplashPage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/OnBoardingPage':
                  return PageTransition(
                    child: const OnBoardingPage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/LoginPage':
                  return PageTransition(
                    child: const LoginPage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/RegisterPage':
                  return PageTransition(
                    child: const RegisterPage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/ExplorePage':
                  return PageTransition(
                    child: ExplorePage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/ProfilePage1':
                  return PageTransition(
                    child: ProfilePage1(
                      userEmail: '',
                      userName: '',
                    ),
                    type: PageTransitionType.rightToLeft,
                  );

                case '/AdminLoginPage':
                  return PageTransition(
                    child: const AdminLoginPage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/AdminExplorePage':
                  return PageTransition(
                    child: AdminExplorePage(),
                    type: PageTransitionType.rightToLeft,
                  );
                case '/BookedPage':
                  return PageTransition(
                      isIos: true,
                      child: const BookedPage(),
                      type: PageTransitionType.rightToLeft);
                case '/TermsAndConditionPage':
                  return PageTransition(
                      isIos: true,
                      child: const TermsAndConditionPage(),
                      type: PageTransitionType.rightToLeft);
                case '/FAQPage':
                  return PageTransition(
                      isIos: true,
                      child: const FAQPage(),
                      type: PageTransitionType.rightToLeft);
                case '/EditProfilePage':
                  return PageTransition(
                      isIos: true,
                      child: const EditProfilePage(),
                      type: PageTransitionType.rightToLeft);
                case '/ProfilePage':
                  return PageTransition(
                      isIos: true,
                      child: const ProfilePage(),
                      type: PageTransitionType.rightToLeft);
                case '/BookingConfirmation':
                  Cars cars = Cars(
                    carId: '123', // Replace '123' with the actual car ID
                    carHostId:
                        '456', // Replace '456' with the actual car host ID
                    carManufacturer:
                        'Toyota', // Replace 'Toyota' with the actual car manufacturer
                    carModel:
                        'Camry', // Replace 'Camry' with the actual car model
                    carMakeYear:
                        2022, // Replace 2022 with the actual car make year
                    carMileage:
                        50000, // Replace 50000 with the actual car mileage
                    carGasConsumption:
                        15, // Replace 10.5 with the actual car gas consumption
                    carRentPrice:
                        500, // Replace 50.0 with the actual car rent price
                    carLicenseNumber:
                        'ABC123', // Replace 'ABC123' with the actual car license number
                    carLocation:
                        'New York', // Replace 'New York' with the actual car location
                    carCity:
                        'City Name', // Replace 'City Name' with the actual car city
                    carWheelDrive:
                        '4WD', // Replace '4WD' with the actual car wheel drive
                    carTransmission:
                        'Automatic', // Replace 'Automatic' with the actual car transmission
                    carSeats:
                        5, // Replace 5 with the actual number of car seats
                    carHoursRented:
                        10, // Replace 10 with the actual number of hours rented
                    carTimesRented:
                        2, // Replace 2 with the actual number of times rented
                    carImageUrl:
                        'https://example.com/car_image.jpg', // Replace the URL with the actual car image URL
                  );

// Replace this with the actual code to create a Cars object
                  return PageTransition(
                    child: BookingConfirmation(
                      car:
                          cars, // Pass the created Cars object to the BookingConfirmation constructor
                      startDate: DateTime
                          .now(), // Replace DateTime.now() with the actual start date
                      endDate: DateTime
                          .now(), // Replace DateTime.now() with the actual end date
                    ),
                    type: PageTransitionType.rightToLeft,
                  );
              }
              return null; // Return null if no route is matched
            },
          ),
        );
      },
    );
  }
}
