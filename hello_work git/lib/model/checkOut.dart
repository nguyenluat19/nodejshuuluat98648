// ignore: file_names
import 'package:flutter/material.dart';
import 'Explore.dart'; // Đảm bảo bạn đã tạo file này

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Preview & Check out'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Phần hình ảnh địa điểm và hướng dẫn viên
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/guide.png'), // Đảm bảo hình ảnh được lưu đúng đường dẫn
                  fit: BoxFit.cover,
                ),
              ),
              child: const Row(
                children: [
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/avt.jpg'), // Ảnh hướng dẫn viên
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Phần thông tin chi tiết chuyến đi
            const Text(
              'Hanoi, Vietnam',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Date: Feb 2, 2020'),
            const Text('Time: 8:00AM - 10:00AM'),
            const Text('Guide: Emmy'),
            const Text('Number of Travelers: 2'),

            const SizedBox(height: 16),
            const Text('Attractions:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const ListTile(
              leading: Icon(Icons.place),
              title: Text('Ho Guom'),
            ),
            const ListTile(
              leading: Icon(Icons.place),
              title: Text('Ho Hoan Kiem'),
            ),
            const ListTile(
              leading: Icon(Icons.place),
              title: Text('Pho 12 Pho Kim Ma'),
            ),

            const SizedBox(height: 16),
            const Text(
              'Total: \$20.00',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 8),
            const Text(
              '50% payment',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'You just need to pay upfront 50%',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$10.00',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),

            const Spacer(),

            // Nút "CHECK OUT"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Explore()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('CHECK OUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: const Center(
        child: Text('Welcome to Explore page'),
      ),
    );
  }
}
