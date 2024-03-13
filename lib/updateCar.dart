import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'adminExplore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UpdateCar());
}

class UpdateCar extends StatelessWidget {
  const UpdateCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Update Car',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final CollectionReference _car =
      FirebaseFirestore.instance.collection('cars');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _priceController.text = documentSnapshot['carRentPrice'].toString();
      _locationController.text = documentSnapshot['carLocation'];
      _licenseController.text = documentSnapshot['carLicenseNumber'].toString();
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'New Price'),
              ),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Updated Location',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(action == 'create' ? 'Create' : 'Update'),
                onPressed: () async {
                  final String price = _priceController.text;
                  final String? location = _locationController.text;

                  if (price.isNotEmpty &&
                      location != null &&
                      location.isNotEmpty) {
                    if (action == 'create') {
                      await _car.add({
                        "carRentPrice": int.parse(price),
                        "carLocation": location,
                      });
                    }

                    if (action == 'update') {
                      await _car.doc(documentSnapshot!.id).update({
                        "carRentPrice": int.parse(price),
                        "carLocation": location,
                      });
                    }

                    _priceController.text = '';
                    _locationController.text = '';

                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteProduct(String productId) async {
    await _car.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have successfully deleted the car from the system'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.deepPurple,
  title: const Text('Update Car'),
  centerTitle: true,
  elevation: 0, // Set elevation to 0
  leading: BackButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminExplorePage()),
      );
    },
  ),
),

      body: StreamBuilder(
        stream: _car.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                        'Car License Number: ${documentSnapshot['carLicenseNumber']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rent Price: ${documentSnapshot['carRentPrice']}'
                            .toString()),
                        Text('Location: ${documentSnapshot['carLocation']}'
                            .toString()),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _createOrUpdate(documentSnapshot),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _deleteProduct(documentSnapshot.id),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
