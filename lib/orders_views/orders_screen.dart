import 'package:flutter/material.dart';
import 'package:latop_main/orders_views/order_details_screeen.dart'; // Import the order details screen

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // 5 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Orders",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            isScrollable: true, // Make tabs scrollable
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF8E6CEE), // Purple active tab
            ),
            tabs: const [
              Tab(text: "Processing"),
              Tab(text: "Shipped"),
              Tab(text: "Delivered"),
              Tab(text: "Returned"),
              Tab(text: "Canceled"),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(5, (index) => _buildOrderList(context)),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context) {
    List<Map<String, String>> orders = [
      {"orderId": "#456765", "items": "4 items"},
      {"orderId": "#454569", "items": "2 items"},
      {"orderId": "#454809", "items": "1 item"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to Order Details Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  OrderDetailsScreen(
                  orderId: orders[index]["orderId"]!,
                  itemCount: orders[index]["items"]!,
                  address: "2715 Ash Dr. San Jose, South Dakota 83475",
                  phoneNumber: "121-224-7890",
                ),

              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ${orders[index]["orderId"]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          orders[index]["items"]!,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
          ),
        );
      },
    );
  }
}
