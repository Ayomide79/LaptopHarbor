import 'package:flutter/material.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        "icon": Icons.notifications_active, // Bell with red dot
        "text":
        "Gilbert, you placed an order. Check your order history for full details.",
      },
      {
        "icon": Icons.notifications_none, // Normal bell icon
        "text":
        "Gilbert, Thank you for shopping with us. We have canceled order #24568.",
      },
      {
        "icon": Icons.notifications_none, // Normal bell icon
        "text":
        "Gilbert, your Order #24568 has been confirmed. Check your order history for full details.",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    notifications[index]["icon"],
                    size: 24,
                    color: index == 0 ? Colors.red : Colors.black87,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      notifications[index]["text"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
