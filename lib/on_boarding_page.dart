import 'package:dots_indicator/dots_indicator.dart';
import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

final List _onBoardingPageList = [
  {
    'image': onBoarding1,
    'title': 'Own a vehicle without really purchasing one. Book it Now',
    'subtitle': '.',
  },
  {
    'image': onBoarding2,
    'title': 'Select a Car',
    'subtitle':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio adipiscing euismod nec, lectus. Aliquam a pellentesque tincidunt auctor.',
  },
];

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: 16,
              width: 50,
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    _onBoardingPageList.length - 1,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                },
                child: _pageIndex != _onBoardingPageList.length - 1
                    ? const Text('Skip',
                        style: TextStyle(
                          color: Color(0xFF03045E),
                        ))
                    : const SizedBox(
                        height: 16,
                        width: 50,
                      ),
              ),
            ),
            DotsIndicator(
              dotsCount: _onBoardingPageList.length,
              position: _pageIndex,
              decorator: DotsDecorator(
                sizes: [
                  const Size(12, 4),
                  const Size(12, 4),
                ],
                activeSize: const Size(20, 4),
                activeColor: const Color(0xFF03045E),
                shapes: [
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ],
                activeShapes: [
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              height: 16,
              width: 50,
              child: GestureDetector(
                onTap: () {
                  if (_pageIndex != _onBoardingPageList.length - 1) {
                    _pageController.animateToPage(
                      _pageIndex + 1,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  } else {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    
                    Navigator.pushReplacementNamed(context, '/LoginPage');
                  }
                },
                child: Text(
                  _pageIndex != _onBoardingPageList.length - 1
                      ? 'Next'
                      : 'Login',
                  style: const TextStyle(
                    color: Color.fromRGBO(84, 86, 203, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _onBoardingPageList.length,
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Image.asset(_onBoardingPageList[index]['image']),
                ),
                const SizedBox(height: 40),
                Text(
                  _onBoardingPageList[index]['title'],
                  style: TextStyle(color: Colors.black, fontSize: 18.0.sp),
                ),
                const SizedBox(height: 10),
                Text(
                  _onBoardingPageList[index]['subtitle'],
                  style: TextStyle(
                      color: const Color(0xFF03045E), fontSize: 14.0.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
