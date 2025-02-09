import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final List<Map<String, dynamic>> variants;

  PurchaseDetailScreen({
    required this.name,
    required this.image,
    required this.description,
    required this.variants,
  });

  @override
  _PurchaseDetailScreenState createState() => _PurchaseDetailScreenState();
}

class _PurchaseDetailScreenState extends State<PurchaseDetailScreen> {
  String? selectedVariant;
  int? selectedPrice;
  final TextEditingController dpController = TextEditingController();
  int tenor = 1;
  double? monthlyInstallment;
  final NumberFormat currencyFormat = NumberFormat.decimalPattern('id');

  void calculateInstallment() {
    if (selectedPrice == null || dpController.text.isEmpty) return;
    int dp = int.parse(dpController.text.replaceAll('.', ''));
    if (dp >= selectedPrice! || tenor < 1 || tenor > 5) return;

    int remainingAmount = selectedPrice! - dp;
    double interestRate = tenor > 3 ? 0.05 : 0.03;
    double totalDebt =
        remainingAmount + (remainingAmount * interestRate * tenor);
    int totalMonths = tenor * 12;
    setState(() {
      monthlyInstallment = totalDebt / totalMonths;
    });
  }

  void _launchWhatsApp() async {
    final Uri url = Uri.parse("https://wa.me/6282131045284");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembelian ${widget.name}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.image,
                  width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(widget.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(widget.description),
              SizedBox(height: 20),

              // Card untuk Simulasi Kredit
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Simulasi Kredit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Pilih Varian:"),
                      DropdownButton<String>(
                        value: selectedVariant,
                        hint: Text("Pilih Varian"),
                        isExpanded: true,
                        items: widget.variants.map((variant) {
                          return DropdownMenuItem<String>(
                            value: variant['variant'],
                            child: Text(
                                "${variant['variant']} - Rp ${currencyFormat.format(variant['price'])}"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedVariant = value;
                            selectedPrice = widget.variants.firstWhere(
                                (v) => v['variant'] == value)['price'];
                            monthlyInstallment = null;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: dpController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: "Masukkan DP (Rp)"),
                        onChanged: (value) {
                          dpController.value = TextEditingValue(
                            text: currencyFormat.format(
                                int.tryParse(value.replaceAll('.', '')) ?? 0),
                            selection: TextSelection.collapsed(
                                offset: currencyFormat
                                    .format(int.tryParse(
                                            value.replaceAll('.', '')) ??
                                        0)
                                    .length),
                          );
                          calculateInstallment();
                        },
                      ),
                      SizedBox(height: 10),
                      Text("Pilih Tenor (tahun):"),
                      DropdownButton<int>(
                        value: tenor,
                        isExpanded: true,
                        items:
                            List.generate(5, (index) => index + 1).map((year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text("$year Tahun"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            tenor = value!;
                            calculateInstallment();
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      if (monthlyInstallment != null)
                        Text(
                          "Cicilan per bulan: Rp ${currencyFormat.format(monthlyInstallment!.toInt())} selama ${tenor * 12} bulan",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Tombol WhatsApp
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _launchWhatsApp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna hijau WhatsApp
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    "Pesan via WhatsApp",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
