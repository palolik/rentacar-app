import 'dart:io';

import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  late User? _currentUser;
  late DocumentReference<Map<String, dynamic>> _userDocRef;

  File? _selectedImage;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    final auth = FirebaseAuth.instance;
    _currentUser = auth.currentUser;
    _userDocRef =
        FirebaseFirestore.instance.collection('users').doc(_currentUser!.uid);
    _loadUserData();
  }

  void _loadUserData() {
    _userDocRef.get().then((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        _nameController.text = data?['name'] ?? '';
        _emailController.text = data?['email'] ?? '';
        _mobileNumberController.text = data?['mobileNumber'] ?? '';
        setState(() {
          _profileImageUrl = data?['profileImageUrl'];
        });
      }
    });
  }

  void _updateUserData() {
    _userDocRef.update({
      'name': _nameController.text,
      'email': _emailController.text,
      'mobileNumber': _mobileNumberController.text,
    }).then((_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Profile updated successfully.'),
        ));
      }
    }).catchError((error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to update profile. Please try again.'),
        ));
      }
    });
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          chooseOptionBottomSheet();
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: colorD2,
                          backgroundImage: _profileImageUrl != null
                              ? NetworkImage(_profileImageUrl!)
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: -12,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            chooseOptionBottomSheet();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: white, width: 1.2),
                              color: primaryColor,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 1.5.h,
                                  child: Image.asset(camera),
                                ),
                                widthSpace5,
                                Text('Change', style: whiteMedium13),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              heightSpace20,
              Text('Full Name', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: color94Medium14,
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your name',
                    hintStyle: color94Medium14,
                  ),
                ),
              ),
              heightSpace15,
              Text('Email', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: color94Medium14,
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                    hintStyle: color94Medium14,
                  ),
                ),
              ),
              heightSpace15,
              Text('Mobile Number', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: color94Medium14,
                  controller: _mobileNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your mobile number',
                    hintStyle: color94Medium14,
                  ),
                ),
              ),
              heightSpace20,
              PrimaryButton(
                title: 'Save',
                onTap: () {
                  _updateUserData();
                  Navigator.pop(context);
                },
              ),
              heightSpace20,
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize appBarMethod() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(
        title: 'Edit Profile',
      ),
    );
  }

  void chooseOptionBottomSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choose Option', style: blackBold18),
              heightSpace20,
              Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 33),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        _handleImageOption(index);
                      },
                      child: SizedBox(
                        width: 60,
                        height: 100,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: index == 0
                                  ? const Color(0xff009688)
                                  : index == 1
                                      ? const Color(0xff00A7F7)
                                      : const Color(0xffDD5A5A),
                              child: SizedBox(
                                height: 2.5.h,
                                child: Image.asset(index == 0
                                    ? camera
                                    : index == 1
                                        ? gallery
                                        : bin),
                              ),
                            ),
                            heightSpace5,
                            Text(
                              index == 0
                                  ? 'Camera'
                                  : index == 1
                                      ? 'Gallery'
                                      : 'Remove photo',
                              style: color94Regular14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleImageOption(int index) async {
    final picker = ImagePicker();
    final pickedImage = index == 0
        ? await picker.pickImage(source: ImageSource.camera)
        : index == 1
            ? await picker.pickImage(source: ImageSource.gallery)
            : null;

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });

      _uploadImageToStorage();
    }
  }

  void _uploadImageToStorage() async {
    if (_selectedImage == null) return;

    final userId = _currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref().child('users/$userId');
    final uploadTask = storageRef.putFile(_selectedImage!);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();

    setState(() {
      _profileImageUrl = downloadUrl;
    });
  }
}
