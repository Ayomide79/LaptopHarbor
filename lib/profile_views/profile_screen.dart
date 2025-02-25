import 'package:flutter/material.dart';
import 'address_page.dart';
import 'payment_page.dart';
import 'wishlist_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Gilbert Jones",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "Gilbertjones001@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
          const Text(
            "121-224-7890",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          _buildProfileOption(context, "Address", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressPage()),
            );
          }),
          _buildProfileOption(context, "Wishlist", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WishlistPage()),
            );
          }),
          _buildProfileOption(context, "Payment", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          }),
          _buildProfileOption(context, "Help", () {}),
          _buildProfileOption(context, "Support", () {}),
          const Spacer(),
          TextButton(
            onPressed: ()
            {},
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
