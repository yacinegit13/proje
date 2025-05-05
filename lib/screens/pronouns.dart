import 'package:flutter/material.dart';

class PronounsPage extends StatelessWidget {
  final List<String> kitchenwareList = [
    'I', 'You', 'He', 'It',
    'We', 'They',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Language Pronouns")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: kitchenwareList.length,
          itemBuilder: (context, index) {
            String item = kitchenwareList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color:Color.fromARGB(255, 63, 150, 222)),
                ),
              ),
              onPressed: () => _showSignDialog(context, item),
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSignDialog(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(item),
        content: Image.asset(
          'assets/pronouns/$item.gif', // تأكد أن الصور موجودة في هذا المسار
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