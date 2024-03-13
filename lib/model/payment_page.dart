import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../../../utils/widgets.dart';

import '../bookingConfirmationPage.dart';
import '../utils/constant.dart';
import 'Cars.dart';

class PaymentPage extends StatefulWidget {
  final Cars car;
  final DateTime startDate;
  final DateTime endDate;

  const PaymentPage({Key? key, required this.car, required this.startDate, required this.endDate}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Select Payment Method',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text('Payment Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              cardPayment(),
              SizedBox(height: 20),
              PrimaryButton(
                title: 'Continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmation(
                        car: widget.car,
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget cardPayment() {
    return Column(
      children: [
        CreditCardWidget(
          cardBgColor: primaryColor,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (e) {},
        ),
        CreditCardForm(
          cursorColor: primaryColor,
          formKey: formKey,
          onCreditCardModelChange: onCreditCardModelChange,
          obscureCvv: true,
          obscureNumber: true,
          cardHolderDecoration: InputDecoration(
            labelText: 'Card holder name',
            labelStyle: color94Regular14,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          cardNumberDecoration: InputDecoration(
            labelText: 'Card number',
            hintText: 'XXXX XXXX XXXX XXXX',
            hintStyle: color94Regular14,
            labelStyle: color94Regular14,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          expiryDateDecoration: InputDecoration(
            labelText: 'MM/YY',
            hintText: 'XX/XX',
            hintStyle: color94Regular14,
            labelStyle: color94Regular14,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          cvvCodeDecoration: InputDecoration(
            labelText: 'CVV',
            hintText: 'XXX',
            hintStyle: color94Regular14,
            labelStyle: color94Regular14,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          cardHolderName: '',
          cardNumber: '',
          cvvCode: '',
          expiryDate: '',
          themeColor: white,
        ),
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
