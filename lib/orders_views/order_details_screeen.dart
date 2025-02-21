import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final String itemCount;
  final String address;
  final String phoneNumber;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.itemCount,
    required this.address,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Order $orderId",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status
            _buildOrderStatus("Delivered", "28 May", isCompleted: false),
            _buildOrderStatus("Shipped", "28 May", isCompleted: true),
            _buildOrderStatus("Order Confirmed", "28 May", isCompleted: true),
            _buildOrderStatus("Order Placed", "28 May", isCompleted: true),

            const SizedBox(height: 20),

            // Order Items
            const Text(
              "Order Items",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildOrderItem(),

            const SizedBox(height: 20),

            // Shipping Details
            const Text(
              "Shipping details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildShippingDetails(address, phoneNumber),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus(String title, String date, {required bool isCompleted}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isCompleted ? Color(0xFF8E6CEE) : Colors.grey[300],
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isCompleted ? Colors.black : Colors.grey[400],
            ),
          ),
          const Spacer(),
          Text(
            date,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.receipt_long, size: 30),
              const SizedBox(width: 10),
              Text("$itemCount items"),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(
                color: Color(0xFF8E6CEE),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingDetails(String address, String phone) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(address, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          Text(phone, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
