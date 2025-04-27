import 'package:flutter/material.dart';

class AnimalsPage extends StatelessWidget {
  final List<String> animalsList = [
    'Cat', 'Chicken', 'Cow',
    'Dog', 'Duck', 'Horse', 'Sheep',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Language Animals")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: animalsList.length,
          itemBuilder: (context, index) {
            String animal = animalsList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () => _showSignDialog(context, animal),
              child: Text(
                animal,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String animal) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(animal),
        content: Image.asset(
          'assets/animals/$animal.png', // تأكد من أسماء الصور
          fit: BoxFit.cover,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}