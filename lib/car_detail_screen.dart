import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

final NumberFormat currencyFormat = NumberFormat.decimalPattern('id');

class CarDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final List<String> highlight;
  final List<Map<String, dynamic>> variants;

  CarDetailScreen(
      {required this.name,
      required this.image,
      required this.description,
      required this.highlight,
      required this.variants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text('Highlight Features',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: highlight
                  .map((feature) => Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("- " + feature,
                              style: TextStyle(fontSize: 16)),
                        ),
                      ))
                  .toList(),
            ),
            ExpansionTile(
              title: Text('Harga dan Varian',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Varian',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Harga',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: variants
                        .map((variant) => DataRow(cells: [
                              DataCell(Text(variant['variant']!)),
                              DataCell(Text(
                                  "Rp ${currencyFormat.format(variant['price'])}")),
                            ]))
                        .toList(),
                  ),
                ),
                SizedBox(height: 8), // Memberikan jarak sebelum teks
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Harga tertera adalah harga OTR cash Jogjakarta",
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
