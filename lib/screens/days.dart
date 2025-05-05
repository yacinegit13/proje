import 'package:flutter/material.dart';

class SignLanguageDays extends StatelessWidget {
  final List<String> daysList = [
   /* 'Monday': 'images/monday1.jpg',
    'Tuesday': 'images/tusday.PNG',
    'Wednesday': 'images/wedensday.PNG',
    'Thursday': 'images/thursday.PNG',
    'Friday': 'images/friday.jpg',
    'Saturday': 'images/saturday.jpg',
    'Sunday': 'images/sunday1.png',
    'Weekend': 'images/sunday1.png',*/
    'Saturday','Sunday','Monday','Thursday', 'Wednesday', 'Tuesday','Friday',
    'Weekend'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jours de la semaine")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: daysList.length,
          itemBuilder: (context, index) {
            String day = daysList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Color.fromARGB(255, 63, 150, 222)),
                ),
              ),
              onPressed: () => _showDayDialog(context, day),
              child: Text(
                day,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDayDialog(BuildContext context, String day) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Jour : $day'),
            content: Image.asset('assets/days/$day.gif', fit: BoxFit.cover),
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

