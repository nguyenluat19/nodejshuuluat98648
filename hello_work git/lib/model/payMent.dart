// ignore: file_names
import 'package:flutter/material.dart';
import './checkOut.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Payment", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildStepIndicator("Payment Method", isActive: true),
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
                _buildStepIndicator("Preview & Check out", isActive: false),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Card Information",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 20),
            _buildTextField("Card Holder's Name"),
            _buildTextField("Card Number"),
            Row(
              children: [
                Expanded(child: _buildTextField("Expiration Date")),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField("CVV")),
              ],
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Điều hướng tới trang Explore
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Checkout()),
                    );
                  },
                  child:
                      const Text("NEXT", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(String text, {required bool isActive}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: isActive ? Colors.green : Colors.grey,
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.green : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
