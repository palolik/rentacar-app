import 'package:flutter/material.dart';

import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:rent_my_ride_s1/utils/widgets.dart';
import 'package:rent_my_ride_s1/services/auth.dart';
import 'package:sizer/sizer.dart';
import 'adminExplore.dart';
import 'authenticate/login_page.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isPasswordVisible = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(205),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0, // Set elevation to 0
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 0,
                          129), // Set the button background color to blue
                    ),
                    child: const Text('Login'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                          'rayhan@gmail.com', // Admin email
                          'admin1', // Admin password
                        );
                        if (result == null) {
                          setState(() {
                            error = 'Invalid email or password';
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminExplorePage(),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0),
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
