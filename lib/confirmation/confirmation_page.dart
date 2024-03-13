/*import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'confirmation_dialog.dart';
import '../../../utils/widgets.dart';


class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Confirmation',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace20,
              Text('Please Review Your Request and Confirm', style: primaryRegular13),
              heightSpace20,
              carDetailMethod(),
              heightSpace10,
              ...userDetailMethod(),
              heightSpace10,
              pickAndReturnDetailsMethod(),
              heightSpace10,
              rentDetailsMethod(),
              heightSpace10,
              paymentDetailMethod(),
              heightSpace20,
              PrimaryButton(
                title: 'Confirm & Book',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ConfirmationDialog(
                      nameController: _nameController,
                      mobileNumberController: _mobileNumberController,
                      emailController: _emailController,
                      carDetails: const {
                        'carName': 'Mercedes',
                        'carModel': 'Bens w176',
                        'carImage': 'car_image_url',
                        'rentalFees': 200.0,
                        'totalDays': 3,
                        'totalFees': 800.0,
                      },
                    ),
                  );
                },
              ),
              heightSpace20,
            ],
          ),
        ),
      ),
    );
  }
  MyContainerWithChild paymentDetailMethod() {
    return MyContainerWithChild(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment method', style: blackRegular15),
              Row(
                children: [
                  SizedBox(height: 2.h, child: Image.asset(edit)),
                  Text('Change', style: primaryMedium12),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(height: 3.h, child: Image.asset(paymentType1)),
              widthSpace5,
              Text('**** **** **** 2147', style: color94Regular14)
            ],
          )
        ],
      ),
    );
  }

  MyContainerWithChild rentDetailsMethod() {
    return MyContainerWithChild(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rental Fees', style: blackRegular15),
          heightSpace10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('One day rent', style: color94Regular14),
              Text('\$200', style: color94Regular14),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total of 3 days', style: color94Regular14),
              Text('\$600', style: color94Regular14),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: colorD2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Fees', style: primaryMedium15),
              Text('\$800', style: primaryMedium15),
            ],
          ),
        ],
      ),
    );
  }

  MyContainerWithChild pickAndReturnDetailsMethod() {
    return MyContainerWithChild(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pick-up and Return', style: color94Regular14),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/ChangeTimeAndLocationPage');
                },
                child: Row(
                  children: [
                    SizedBox(height: 2.h, child: Image.asset(edit)),
                    Text('Change', style: primaryMedium12),
                  ],
                ),
              ),
            ],
          ),
          Text('Washington Manchester - Same location', style: blackRegular15),
          const Divider(color: colorD2),
          heightSpace10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trip Dates', style: color94Regular14),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/ChangeTimeAndLocationPage');
                },
                child: Row(
                  children: [
                    SizedBox(height: 2.h, child: Image.asset(edit)),
                    Text('Change', style: primaryMedium12),
                  ],
                ),
              ),
            ],
          ),
          Text('Thu 15 April, 11:00 am - Sat 17 April, 6:00 pm',
              style: blackRegular15),
          heightSpace15,
        ],
      ),
    );
  }

  List<Widget> userDetailMethod() {
    return [
      MyContainerWithChild(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace5,
            TextField(
              cursorColor: primaryColor,
              controller: _nameController,
              style: blackRegular15,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text('Name', style: color94Regular14),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
              ),
            ),
            TextField(
              cursorColor: primaryColor,
              controller: _mobileNumberController,
              style: blackRegular15,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Mobile Number', style: color94Regular14),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
              ),
            ),
            TextField(
              cursorColor: primaryColor,
              controller: _emailController,
              style: blackRegular15,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text('Email', style: color94Regular14),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorD2)),
              ),
            ),
            heightSpace10,
            Text('National ID', style: color94Regular14),
            heightSpace2,
            Text('297* **** **** ****', style: blackRegular15),
            heightSpace15,
          ],
        ),
      ),
    ];
  }

  MyContainerWithChild carDetailMethod() {
    return MyContainerWithChild(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          SizedBox(height: 60, child: Image.asset(carDetailMain)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mercedes', style: blackMedium18),
              Text('Bens w176', style: color94Regular12),
            ],
          )),
          Text.rich(TextSpan(children: [
            TextSpan(text: '\$200 ', style: primaryBold14),
            TextSpan(text: '| day', style: color94Regular14),
          ]))
        ],
      ),
    );
  }
}
*/