import 'package:flutter/material.dart';
import 'model/Cars.dart';
import 'bookCarDetailsPage.dart';

class CarTile extends StatelessWidget {
  final Cars car;
  const CarTile({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookCarDetails(
                      car: car,
                    )));
      },
      splashColor: const Color.fromARGB(255, 7, 0, 130),
      child: Padding(
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
                            '${car.carLocation}, ${car.carCity}',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
