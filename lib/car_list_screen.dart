import 'package:flutter/material.dart';
import 'car_detail_screen.dart';
import 'purchase_screen.dart';

class CarListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cars = [
    {
      'name': 'New Creta',
      'image': 'assets/creta3.jpg',
      'description':
          'Sebuah mobil compact SUV dibuat di Indonesia untuk orang Indonesia! kini hadir dengan wajah baru',
      'highlight': [
        'New exterior and interior design',
        'Hyundai Smartsense',
        'Mesin 1.5L dengan IVT(varian N Line dan Prime)',
        'Mesin baru 1.5L turbo dengan 7 speed DCT (varian N Line turbo)',
        'Bluelink'
      ],
      'variants': [
        {'variant': 'Prime 1.5L', 'price': 400000000},
        {'variant': 'N Line 1.5L', 'price': 463000000},
        {'variant': 'N Line 1.5L turbo', 'price': 508000000}
      ]
    },
    {
      'name': 'Ioniq 5',
      'image': 'assets/ioniq.jpg',
      'description':
          'Sebuah mobil electric Hyundai yang menjadi salah sebuah pionir mobil listrik di Indonesia, bersaing sebagai medium SUV kami menjanjikan kenyamanan di setiap perjalanan anda',
      'highlight': [
        '481 KM dalam sekali charge',
        'Hyundai Smartsense',
        'Bluelink',
        'V2L',
        '217 Ps 350 Nm 0-100 dalam 3,4 detik',
        'All electric seat (varian Signature)'
      ],
      'variants': [
        {'variant': 'Prime long range', 'price': 810000000},
        {'variant': 'Signature long range', 'price': 902000000}
      ]
    },
    {
      'name': 'New Ioniq 5N',
      'image': 'assets/ioniq5n.jpg',
      'description':
          'Line up Hyundai N kini hadir di Indonesia dengan Hyundai Ioniq 5N, versi performa dari Hyundai Ioniq 5 yang dapat memberikan tenaga setara sports car',
      'highlight': [
        '519 KM dalam sekali charge',
        'Hyundai Smartsense',
        'Bluelink',
        'V2L',
        '326 Ps 605 Nm'
      ],
      'variants': [
        {'variant': 'Ioniq 5N', 'price': 1440700000}
      ]
    },
    {
      'name': 'Ioniq 6',
      'image': 'assets/ioniq6.png',
      'description':
          'Mobil listrik sedan mewah dari Hyundai dengan segudang fitur yang dimiliki memanjakan anda di setiap perjalanan',
      'highlight': [
        'Semua fitur Hyundai Ioniq 5 ditambah',
        '650 Ps 770 Nm',
        'Dual motor AWD',
        'New N Package'
      ],
      'variants': [
        {'variant': 'Signature', 'price': 1207000000}
      ]
    },
    {
      'name': 'New Kona Electric',
      'image': 'assets/konaEv3.jpeg',
      'description':
          'Versi baru dari pionir mobil listrik di Indonesia telah hadir, Hyundai Kona EV dengan chassis full electric siap memberikan pilihan baru di kelas electric compact SUV',
      'highlight': [
        '549 KM (Signature dan N Line) dan 602 KM (Prime) dalam sekali charge',
        'Hyundai Smartsense',
        'N Line bodykit (N Line)',
        'Bluelink',
        'V2L',
        '217 Ps 255 Nm'
      ],
      'variants': [
        {'variant': 'Prime long range', 'price': 619000000},
        {'variant': 'Signature long range', 'price': 652000000},
        {'variant': 'N Line', 'price': 673000000}
      ]
    },
    {
      'name': 'Palisade',
      'image': 'assets/palisade.jpg',
      'description':
          'Mobil mewah SUV dari hyundai yang ditenagai mesin diesel siap memberikan kenyamanan di kota sekaligus tenaga di pegunungan',
      'highlight': [
        'Captain seat with electric adjustment',
        'Comfortable seven seater',
        'Sunroof and Moonroof'
            'Hyundai Smartsense',
        'XRT bodykit (varian + XRT package)',
        'Bluelink',
        '8 Speed automatic',
        '147 Ps 440 Nm'
      ],
      'variants': [
        {'variant': 'Signature', 'price': 1060000000},
        {'variant': 'Signature AWD', 'price': 1201000000},
        {'variant': 'Signature XRT', 'price': 1231000000},
        {'variant': 'Signature AWD XRT', 'price': 1231000000}
      ]
    },
    {
      'name': 'New Santa Fe',
      'image': 'assets/santafe3.jpg',
      'description':
          'Model baru dari medium SUV 7 seater hyundai, kini ditenagai mesin hybrid yang bertenaga dan ramah lingkungan',
      'highlight': [
        'Chassis baru beserta perubahan pada eksterior dan interior',
        'Hyundai Smartsense',
        'Captain seat',
        'Proper 3 row SUV',
        'Bluelink',
        '1.6 L turbo hybrid 235 Ps 367 Nm (Hybrid)'
      ],
      'variants': [
        {'variant': 'Prime 2.5L bensin', 'price': 708000000},
        {'variant': 'Prime 1.6L turbo hybrid', 'price': 796000000},
        {'variant': 'Caligraphy 2.5L bensin', 'price': 798000000},
        {'variant': 'Caligraphy 1.6L turbo hybrid', 'price': 876000000}
      ]
    },
    {
      'name': 'Stargazer',
      'image': 'assets/stargazer.jpg',
      'description':
          'Bermain di segmen low MPV, Hyundai Stargazer siap menemani keluarga anda dengan fitur terlengkap dikelasnya diharga yang terjangkau',
      'highlight': [
        '7 seater MVP dengan opsi captain seat 6 seater',
        'Hyundai Smartsense level 1',
        'Bluelink',
        '115 Ps 143 Nm IVT'
      ],
      'variants': [
        {'variant': 'Prime', 'price': 323000000},
        {'variant': 'Style', 'price': 307000000},
        {'variant': 'Essential', 'price': 278000000}
      ]
    },
    {
      'name': 'New Tucson',
      'image': 'assets/tucson.jpeg',
      'description':
          'Medium MPV Hyundai kini kembali ke Indonesia dengan model terbaru dan mesin hybrid bertenaga',
      'highlight': [
        'Desain Eksterior dan Interior baru',
        'Hyundai Smartsense',
        '5 seater',
        'Bluelink',
        '1.6 L turbo hybrid 235 Ps 367 Nm (Hybrid)'
      ],
      'variants': [
        {'variant': '2.0L bensin', 'price': 637000000},
        {'variant': '1.6L turbo hybrid', 'price': 749000000}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
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
              },
            ),
            ListTile(
              title: Text('Pembelian'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchaseScreen(cars: cars),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(cars[index]['image']!, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        cars[index]['name']!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailScreen(
                                name: cars[index]['name']!,
                                image: cars[index]['image']!,
                                description: cars[index]['description']!,
                                highlight: cars[index]['highlight'],
                                variants: cars[index]['variants']!,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Selengkapnya',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
