import 'package:flutter/material.dart';

class AlphabetCour extends StatelessWidget {
  final List<String> alphabetList = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alphabets")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: alphabetList.length,
          itemBuilder: (context, index) {
            String letter = alphabetList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.redAccent),
                ),
              ),
              onPressed: () => _showSignDialog(context, letter),
              child: Text(
                letter,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String letter) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Lettre $letter'),
            content: Image.asset(
              'assets/alphabets/$letter.png',
              fit: BoxFit.cover,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Fermer"),
              ),
            ],
          ),
    );
  }
}
