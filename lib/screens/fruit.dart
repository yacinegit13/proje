import 'package:flutter/material.dart';
import 'package:projet_signe/main.dart';

class FruitsPage extends StatelessWidget {
  final List<String> fruitsList = [
    'Apple', 'Banana', 'Orange', 'Peach',
    'Pear', 'Pineapple','Avocado',
    'Cherry','Green grapes',
    'Lemon','Watermelon','Lime',
    'Pineapple','Pomegranate','Raspberry',
    'Strawberry'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Language Fruits"),
        backgroundColor: themeNotifier.value ? Colors.black : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: fruitsList.length,
          itemBuilder: (context, index) {
            final fruit = fruitsList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color.fromARGB(255, 63, 150, 222)),
                ),
              ),
              onPressed: () => _showSignDialog(context, fruit),
              child: Text(
                fruit,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String fruit) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(fruit),
        content: Image.asset(
          'assets/fruits/$fruit.gif', // تأكد من وجود الصورة بالاسم الصحيح
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