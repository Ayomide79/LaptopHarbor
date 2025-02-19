import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGender = "Men"; // Default selection
  final Color primaryColor = const Color(0xFF8E6CEE); // Define button color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User profile image
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/profile.jpg"), // Replace with user's profile image
                  ),

                  // Gender selection dropdown
                  DropdownButton<String>(
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: ["Men", "Women"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                    underline: const SizedBox(),
                  ),

                  // Shopping bag icon (Updated Color)
                  IconButton(
                    icon: Icon(Icons.shopping_bag, color: primaryColor, size: 28),
                    onPressed: () {
                      // Handle shopping bag click
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 10),

              // Horizontal Scroll for Categories
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryItem(image: "assets/hoodie.png", label: "Hoodies"),
                    CategoryItem(image: "assets/shorts.png", label: "Shorts"),
                    CategoryItem(image: "assets/shoes.png", label: "Shoes"),
                    CategoryItem(image: "assets/bag.png", label: "Bag"),
                    CategoryItem(image: "assets/accessories.png", label: "Accessories"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Top Selling Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Top Selling", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 10),

              // Horizontal Scroll for Products
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ProductItem(
                      image: "assets/jacket.png",
                      name: "Men's Harrington Jacket",
                      price: "\$148.00",
                    ),
                    ProductItem(
                      image: "assets/slides.png",
                      name: "Max Cirro Men's Slides",
                      price: "\$55.00",
                      oldPrice: "\$100.97",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar (Updated Active Colors)
      bottomNavigationBar: GNav(
        activeColor: primaryColor,
        tabBorderRadius: 16,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 21),
        gap: 8,
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.favorite_border, text: 'Likes'),
          GButton(icon: Icons.notifications, text: 'Alerts'),
          GButton(icon: Icons.person, text: 'Profile'),
        ],
      ),
    );
  }
}

// Category Item Widget
class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

// Product Item Widget
class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String? oldPrice;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(price, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF8E6CEE)
                    )),
                    if (oldPrice != null)
                      Text(
                        " $oldPrice",
                        style: const TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
