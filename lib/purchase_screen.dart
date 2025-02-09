import 'package:flutter/material.dart';
import 'car_list_screen.dart';
import 'purchase_detail_screen.dart';

class PurchaseScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cars;

  PurchaseScreen({required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembelian',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hyundai App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Katalog'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Pembelian'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];

          return ListTile(
            leading: Image.asset(
              car['image'] ?? 'assets/default.jpg', // Hindari null
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              car['name'] ?? 'Tidak Diketahui',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              if (car['variants'] != null && car['variants'].isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchaseDetailScreen(
                      name: car['name']!,
                      image: car['image']!,
                      variants: car['variants']!, // Perbaiki key
                      description: car['description']!,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Varian tidak tersedia')),
                );
              }
            },
          );
        },
      ),
    );
  }
}
