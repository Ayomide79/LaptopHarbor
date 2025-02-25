import 'package:flutter/material.dart';

class AddAddressPage extends StatelessWidget {
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add Address",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("Street Address", streetController),
            Row(
              children: [
                Expanded(child: _buildTextField("City", cityController)),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField("Zip Code", zipController)),
              ],
            ),
            _buildTextField("State", stateController),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Save address logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8E6CEE),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Save"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
