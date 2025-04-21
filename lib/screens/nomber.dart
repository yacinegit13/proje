import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  final List<String> numbersList = List.generate(
    10,
    (index) => index.toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Language Numbers")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: numbersList.length,
          itemBuilder: (context, index) {
            String number = numbersList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.blueAccent),
                ),
              ),
              onPressed: () => _showSignDialog(context, number),
              child: Text(
                number,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String number) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('number $number'),
            content: Image.asset('assets/days/$number.png', fit: BoxFit.cover),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("closing"),
              ),
            ],
          ),
    );
  }
}
