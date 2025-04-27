import 'package:flutter/material.dart';

class VegetablesPage extends StatelessWidget {
  final List<String> vegetablesList = [
    'Cabbage',
    'Green Beans',
    'Lettuce',
    'Onion',
    'Potato',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Language Vegetables"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // صفين لعرض الخضار بشكل أوضح
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: vegetablesList.length,
          itemBuilder: (context, index) {
            String veg = vegetablesList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () => _showSignDialog(context, veg),
              child: Text(
                veg,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String vegName) {
    // اسم الملف يجب أن يطابق الاسم مع استبدال المسافات بـ "_" أو بدون مسافات حسب التسمية
    String imageName = vegName.replaceAll(' ', '_');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(vegName),
        content: Image.asset(
          'assets/vegetables/$imageName.png', // تأكد من الأسماء داخل مجلد الصور
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