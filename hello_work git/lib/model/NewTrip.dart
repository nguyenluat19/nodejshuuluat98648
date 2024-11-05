// ignore: file_names
import 'package:flutter/material.dart';
// import './payMent.dart';
import 'checkPay.dart';

class NewTrip extends StatefulWidget {
  const NewTrip({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChooseGuideState createState() => _ChooseGuideState();
}

class _ChooseGuideState extends State<NewTrip> {
  int numberOfTravelers = 1;
  bool dragonBridgeSelected = true;
  bool myKheBeachSelected = true;
  bool chamMuseumSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Trip"),
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
              const Text("Where you want to explore"),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Danang, Vietnam",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
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
              const Text("Fee"),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Fee (\$/hour)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Guide's Language"),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Korean, English",
                  border: OutlineInputBorder(),
                ),
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
                            builder: (context) =>
                                Checkpay()), // Thay thế bằng màn hình đích của bạn
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          0, 206, 166, 1), // màu nền rgba(0, 206, 166, 1)
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Chiều cao của nút
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bo tròn nút
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          color: Colors.white, // Màu chữ trắng
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

  Widget buildImageCard(String imagePath, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.teal : Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          color: isSelected ? Colors.black.withOpacity(0.5) : null,
          colorBlendMode: isSelected ? BlendMode.darken : null,
        ),
      ),
    );
  }

  Widget buildAddNewCard() {
    return GestureDetector(
      onTap: () {
        // Handle add new attraction
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
