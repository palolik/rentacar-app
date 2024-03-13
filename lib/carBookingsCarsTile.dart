import 'model/CarBooking.dart';
import 'services/database.dart';
import 'model/Cars.dart';

import 'package:flutter/material.dart';

class CarBookingsCarsTile extends StatelessWidget {
  final Cars car;
  final CarBooking carBooking;
  const CarBookingsCarsTile(
      {super.key, required this.car, required this.carBooking});

  @override
  Widget build(BuildContext context) {
    if (carBooking.carId != car.carId) {
      return Container(
        height: 0,
        width: 0,
      );
    } else {
      if (carBooking.carBookingStatus == "booked") {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Container(
            width: double.infinity,
            height: 350.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(233, 248, 248, 251),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 5),
                                blurRadius: 8.0),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(car.carImageUrl),
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
                              '${car.carManufacturer} ${car.carModel} ${car.carMakeYear}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 60),
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              '${car.carRentPrice} RM/hr',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
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
                              car.carCity,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          textStyle: const TextStyle(fontSize: 21),
                          backgroundColor:
                              const Color.fromARGB(255, 0, 16, 134),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: const Text('End Rent'),
                        onPressed: () async {
                          DatabaseService().updateBookingStatus(carBooking);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: popUpMessage(),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: const Duration(seconds: 5),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Container(
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(233, 248, 248, 251),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 5),
                                blurRadius: 8.0),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(car.carImageUrl),
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
                              '${car.carManufacturer} ${car.carModel} ${car.carMakeYear}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 60),
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              '${car.carRentPrice} RM/hr',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
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
                              car.carCity,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
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
  }
}

Stack popUpMessage() {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 5, 168, 24),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: const Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Booking Ended Successfully!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
