import 'package:flutter/material.dart';

import 'car_list_screen.dart';

void main() {
  runApp(CarCatalogApp());
}

class CarCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarListScreen(),
    );
  }
}
