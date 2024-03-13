import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<String> _socialIconsList = [facebook, google, twitter];
  bool _termsAndPrivacy = false;
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _validateName(String value) {
    return value.isNotEmpty;
  }

  bool _validateEmail(String value) {
    return value.isNotEmpty && value.contains('@');
  }

  bool _validateMobileNumber(String value) {
    return value.isNotEmpty && value.length == 10;
  }

  bool _validatePassword(String value) {
    return value.isNotEmpty && value.length >= 6;
  }

  bool _validateConfirmPassword(String value) {
    return value.isNotEmpty && value == _passwordController.text;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(205),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 10,
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          flexibleSpace: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 11.5.h),
                child: SizedBox(
                  height: 111,
                  child: Image.asset(logo),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 4.2.h,
                        child: SvgPicture.asset(arrow, height: 1.5.h)),
                  ),
                  Text(
                    'Register',
                    style: blackBold22,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 3.5.h,
                    height: 3.5.h,
                  )
                ],
              ),
            ),
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                MyContainerWithChild(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff67727d),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff67727d),
                          ),
                          border: InputBorder.none,
                          fillColor: const Color(0xff67727d),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff67727d),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff67727d),
                          ),
                          border: InputBorder.none,
                          fillColor: const Color(0xff67727d),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      TextField(
                        controller: _mobileNumberController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff67727d),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff67727d),
                          ),
                          border: InputBorder.none,
                          fillColor: const Color(0xff67727d),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: _isPasswordVisible,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff67727d),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff67727d),
                          ),
                          border: InputBorder.none,
                          fillColor: const Color(0xff67727d),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _isConfirmPasswordVisible,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff67727d),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff67727d),
                          ),
                          border: InputBorder.none,
                          fillColor: const Color(0xff67727d),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'I accept the terms and privacy policy',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        value: _termsAndPrivacy,
                        onChanged: (bool? value) {
                          setState(() {
                            _termsAndPrivacy = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: primaryColor,
                      ),
                      const SizedBox(
                        height: 1.5,
                      ),
                      ElevatedButton(
                        onPressed: _registerUser,
                        child: const Text('Register'),
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          textStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String mobileNumber = _mobileNumberController.text.trim();
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (!_validateName(name)) {
      showErrorMessage('Please enter a valid name.');
      return;
    }

    if (!_validateEmail(email)) {
      showErrorMessage('Please enter a valid email address.');
      return;
    }

    if (!_validatePassword(password)) {
      showErrorMessage('Please enter a valid password (min. 6 characters).');
      return;
    }

    if (!_validateConfirmPassword(confirmPassword)) {
      showErrorMessage('Passwords do not match.');
      return;
    }

    if (!_termsAndPrivacy) {
      showErrorMessage('Please accept the terms and privacy policy.');
      return;
    }

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;
      if (user != null) {
        // Save user data to Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'mobileNumber': mobileNumber,
          'createdAt': Timestamp.now(),
        });

        Navigator.pushNamed(context, '/ExplorePage');

        showSuccessMessage('Registration successful.');
      } else {
        showErrorMessage('An error occurred. Please try again.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showErrorMessage('The email address is already in use.');
      } else {
        showErrorMessage('An error occurred. Please try again.');
      }
    } catch (e) {
      showErrorMessage('An error occurred. Please try again.');
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
