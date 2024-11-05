// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'NewTrip.dart';

class ChooseGuide extends StatefulWidget {
  const ChooseGuide({super.key});

  @override
  _ChooseGuideState createState() => _ChooseGuideState();
}

class _ChooseGuideState extends State<ChooseGuide> {
  int numberOfTravelers = 1;
  bool dragonBridgeSelected = true;
  bool myKheBeachSelected = true;
  bool chamMuseumSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Information"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Date"),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: "mm/dd/yy",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 20),

              const Text("Time"),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "From",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "To",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text("City"),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Danang",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.location_city),
                ),
              ),
              const SizedBox(height: 20),

              // Number of travelers
              const Text("Number of travelers"),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (numberOfTravelers > 1) numberOfTravelers--;
                      });
                    },
                  ),
                  Text('$numberOfTravelers'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        numberOfTravelers++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Attractions"),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10, // Khoảng cách giữa các phần tử theo chiều ngang
                runSpacing: 10, // Khoảng cách giữa các phần tử theo chiều dọc
                children: [
                  buildImageCard(
                      "assets/images/GroupDrogon.jpg", dragonBridgeSelected,
                      () {
                    setState(() {
                      dragonBridgeSelected = !dragonBridgeSelected;
                    });
                  }),
                  buildImageCard("assets/images/mykhe.jpg", myKheBeachSelected,
                      () {
                    setState(() {
                      myKheBeachSelected = !myKheBeachSelected;
                    });
                  }),
                  buildImageCard("assets/images/museum.jpg", chamMuseumSelected,
                      () {
                    setState(() {
                      chamMuseumSelected = !chamMuseumSelected;
                    });
                  }),
                  buildAddNewCard(),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewTrip()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 206, 166, 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo card ảnh
  Widget buildImageCard(String imagePath, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Gọi lại khi ảnh được chọn
      child: Container(
        margin: const EdgeInsets.all(5), // Tạo khoảng cách giữa các thẻ
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Colors.blue
                : Colors.grey, // Thay đổi màu biên khi chọn
            width: 2, // Độ rộng của biên
          ),
          borderRadius: BorderRadius.circular(8), // Bo tròn các góc
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Bo tròn ảnh
          child: Image.asset(
            imagePath, // Đường dẫn đến ảnh
            fit: BoxFit.cover, // Đảm bảo ảnh phủ đầy container
            width: 100, // Đặt chiều rộng
            height: 100, // Đặt chiều cao
          ),
        ),
      ),
    );
  }

  // Hàm tạo card thêm mới
  Widget buildAddNewCard() {
    return GestureDetector(
      onTap: () {
        // Xử lý sự kiện khi nhấn thêm mới
      },
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 30),
              SizedBox(height: 5),
              Text(
                "Add New",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
