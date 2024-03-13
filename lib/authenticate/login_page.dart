import 'package:rent_my_ride_s1/utils/constant.dart';

import 'package:rent_my_ride_s1/utils/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isRemember = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Successfully logged in
      User? user = userCredential.user;
      if (user != null) {
        // Navigate to the desired page after successful login
        Navigator.pushNamed(context, '/ExplorePage');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Handle user not found error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('User not found.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        // Handle wrong password error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Wrong password.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle other errors
        print('Login error: $e');
      }
    } catch (e) {
      print('Login error: $e');
    }
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
                  // width: 83,
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
            heightSpace20,
            Text(
              'Login',
              style: blackBold22,
              textAlign: TextAlign.center,
            ),
            Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  MyContainerWithChild(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 2.5.h,
                          width: 2.5.h,
                          child: Image.asset(email),
                        ),
                        widthSpace10,
                        Expanded(
                          child: TextFormField(
                            controller: _emailController,
                            cursorColor: primaryColor,
                            style: color94Medium14,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: color94Medium14,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  MyContainerWithChild(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 2.5.h,
                          width: 2.5.h,
                          child: Image.asset(lock),
                        ),
                        widthSpace10,
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            cursorColor: primaryColor,
                            obscureText: _isPasswordVisible,
                            style: color94Medium14,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: color94Medium14,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: color94,
                              size: 2.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isRemember = !_isRemember;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 1.7.h,
                              width: 1.7.h,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.2, color: primaryColor),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: _isRemember
                                  ? Icon(
                                      Icons.check,
                                      color: primaryColor,
                                      size: 1.3.h,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                          widthSpace10,
                          Text(
                            'Remember password',
                            style: primaryRegular13,
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle forget password
                        },
                        child: Text(
                          'Forget password?',
                          style: redRegular13,
                        ),
                      ),
                    ],
                  ),
                  heightSpace20,
                  PrimaryButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    title: 'Login',
                  ),
                  heightSpace20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: color94Regular14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/RegisterPage');
                        },
                        child: Text(
                          'Register Now',
                          style: primaryMedium14,
                        ),
                      ),
                    ],
                  ),
                  heightSpace20,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/AdminLoginPage');
                    },
                    child: Container(
                      width: double
                          .infinity, // Set the width to occupy the full width of the parent
                      height: 40.0, // Increase the height as desired
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      child: Center(
                        child: Text(
                          'Admin Login',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
