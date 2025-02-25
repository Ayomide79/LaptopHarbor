import 'package:flutter/material.dart';
import 'add_address_page.dart';

class AddressPage extends StatelessWidget {
  final List<String> addresses = [
    "2715 Ash Dr. San Jose, South Dakota 83475",
    "2715 Ash Dr. San Jose, South Dakota 83475"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Address",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey.shade200,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(addresses[index], overflow: TextOverflow.ellipsis),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAddressPage()),
                  );
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Color(0xFF8E6CEE)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
