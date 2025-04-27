import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  final List<String> colorNames = [
    'Black', 'Blue', 'Brown', 'Gray',
    'Green', 'Orange', 'Pink', 'Purple',
    'Red', 'White', 'Yellow',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Language Colors"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: colorNames.length,
          itemBuilder: (context, index) {
            final color = colorNames[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
              onPressed: () => _showSignDialog(context, color),
              child: Text(
                color,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String colorName) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(colorName),
        content: Image.asset(
          'assets/colors/$colorName.png', // ضع الصور هنا بهذا المسار
          fit: BoxFit.cover,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}