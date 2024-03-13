// ignore_for_file: unused_import
// ignore_for_file: prefer_const_constructors

import 'services/database.dart';
import 'model/Cars.dart';
import 'package:flutter/material.dart';
import 'reusable_widget/Custom_AppBar.dart';
import 'bookCarDetailsPage.dart';
import 'square.dart';

// ignore: use_key_in_widget_constructors
class CarEarnings extends StatefulWidget {
  final Cars car;

  const CarEarnings({super.key, required this.car});
  @override
  // ignore: library_private_types_in_public_api
  _CarEarnings createState() => _CarEarnings();
}

class _CarEarnings extends State<CarEarnings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          width: double.infinity,
          height: 450.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(233, 248, 248, 251),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Car Details",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 5),
                              blurRadius: 8.0),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(widget.car.carImageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Text(
                            '${widget.car.carManufacturer} ${widget.car.carModel} ${widget.car.carMakeYear}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 60),
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            '${widget.car.carRentPrice} RM/hr',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                        // ignore: prefer_const_literals_to_create_immutables
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            '${widget.car.carLocation}, ${widget.car.carCity}',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hours Rented: ${widget.car.carHoursRented}',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Times Rented: ${widget.car.carTimesRented}',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Total Earnings: ${widget.car.carHoursRented * widget.car.carRentPrice} RM',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  textStyle: TextStyle(fontSize: 25),
                  backgroundColor: Color.fromARGB(255, 0, 21, 129),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Make Payment'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
