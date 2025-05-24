/*import 'package:flutter/material.dart';
// ignore: unused_import
import 'homme_coures.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Courses',
          style: TextStyle(color: Color.fromARGB(255, 63, 150, 222), fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 63, 150, 222)),
      ),
      backgroundColor: const Color.fromARGB(255, 63, 150, 222),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCourseItemWithImage(
                context,
                title: 'Every day Communication Signs',
                progress: 0.6,
                imagePath: 'images/days.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/day');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'nomber Sign Language Sentences',
                progress: 0.3,
                imagePath: 'images/number.webp',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/nomber');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Sign Language Alphabet',
                progress: 0.9,
                imagePath: 'images/alpha.jpg',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/alpha');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Animals',
                progress: 0.2,
                imagePath: 'images/animal.png',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/animal');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Vegetables',
                progress: 0.1,
                imagePath: 'images/legum.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/legume');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Fruits',
                progress: 0.4,
                imagePath: 'images/fruits.png',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/fruite');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Colors',
                progress: 0.7,
                imagePath: 'images/colors.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/color');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Month',
                progress: 0.0,
                imagePath: 'images/months.png',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/moi');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Pronouns',
                progress: 0.0,
                imagePath: 'images/Pronouns.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/Pronouns');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(
              Icons.home_filled,
              'Home',
              isActive: false,
              onPressed: () => Navigator.pop(context),
            ),
            _buildNavButton(
              Icons.quiz,
              'Quiz',
              isActive: false,
              onPressed: () {
                 Navigator.pushNamed(context, '/start_page_quizz');
              },
            ),
            _buildNavButton(
              Icons.text_fields,
              'Aa',
              isActive: true,
              onPressed: () {
                // Add navigation to Aa screen here
              },
            ),
            _buildNavButton(
              Icons.person,
              'Profile',
              isActive: false,
              onPressed: () {
                Navigator.pushNamed(context, '/profilpage');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseItemWithImage(
    BuildContext context, {
    required String title,
    required double progress,
    required String imagePath,
    required VoidCallback onTap,
    required bool imageOnLeft,
  }) {
    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
    );

    final textContent = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 63, 150, 222),
            ),
          ),
          const SizedBox(height: 10),
          /*LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            color: Color.fromARGB(255, 63, 150, 222),
          ),*/
          const SizedBox(height: 5),
         // Text('Completed ${(progress * 100).toInt()}%'),
        ],
      ),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
          ],
        ),
        child: Row(
          children: imageOnLeft
              ? [imageWidget, const SizedBox(width: 16), textContent]
              : [textContent, const SizedBox(width: 16), imageWidget],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    IconData icon,
    String label, {
    bool isActive = false,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Color.fromARGB(255, 63, 150, 222) : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Color.fromARGB(255, 63, 150, 222) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}*/












import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_signe/main.dart';
// ignore: unused_import
import 'homme_coures.dart';
class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeNotifier.value ?   Colors.black : Colors.white,

        elevation: 0,
        title: const Text(
          'My Courses',
          style: TextStyle(color:  Color.fromARGB(255, 63, 150, 222), fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color:  Color.fromARGB(255, 63, 150, 222)),
      ),
      backgroundColor: themeNotifier.value ?   Colors.black : Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCourseItemWithImage(
                context,
                title: 'Every day Communication Signs',
                progress: 0.6,
                imagePath: 'images/days.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/day');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'nomber Sign Language Sentences',
                progress: 0.3,
                imagePath: 'images/number.webp',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/nomber');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Sign Language Alphabet',
                progress: 0.9,
                imagePath: 'images/alpha.jpg',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/alpha');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Animals',
                progress: 0.2,
                imagePath: 'images/animal.png',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/animal');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Vegetables',
                progress: 0.1,
                imagePath: 'images/legum.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/legume');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Fruits',
                progress: 0.4,
                imagePath: 'images/fruits.png',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/fruite');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Colors',
                progress: 0.7,
                imagePath: 'images/colors.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/color');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Month',
                progress: 0.0,
                imagePath: 'images/months.png',
                imageOnLeft: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/moi');
                },
              ),
              const SizedBox(height: 20),
              _buildCourseItemWithImage(
                context,
                title: 'Pronouns',
                progress: 0.0,
                imagePath: 'images/Pronouns.png',
                imageOnLeft: false,
                onTap: () {
                  Navigator.of(context).pushNamed('/Pronouns');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: themeNotifier.value ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: themeNotifier.value ? Colors.grey.withOpacity(0.2) : Colors.black,
              spreadRadius: 2,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           _buildNavButton(
              Icons.home_filled,
              'Home',
              isActive: false,
               onPressed: () {
                 Navigator.pushNamed(context, '/homme');
              },
            ),
            _buildNavButton(
              Icons.quiz,
              'Quiz',
              isActive: false,
              onPressed: () {
                 Navigator.pushNamed(context, '/start_page_quizz');
              },
            ),
            _buildNavButton(
              Icons.text_fields,
              'Aa',
              isActive: true,
              onPressed: () {
                // Add navigation to Aa screen here
              },
            ),
            _buildNavButton(
              Icons.person,
              'Profile',
              isActive: false,
              onPressed: () {
                Navigator.pushNamed(context, '/profilpage');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseItemWithImage(
    BuildContext context, {
    required String title,
    required double progress,
    required String imagePath,
    required VoidCallback onTap,
    required bool imageOnLeft,
    
  }) {
    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
    );

    final textContent = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color:  Color.fromARGB(255, 63, 150, 222),
            ),
          ),
          const SizedBox(height: 10),
          /*LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            color: Color(0xFF1649F1),
          ),*/
          const SizedBox(height: 5),
         /* Text(
            'Completed ${(progress * 100).toInt()}%',
            style: const TextStyle(color: Color(0xFF1649F1)),
          ),*/
        ],
      ),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: themeNotifier.value ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color:  Color.fromARGB(255, 63, 150, 222), // تغيير لون الإطار هنا
            width: 2, // سمك الإطار
          ),
          boxShadow: [
            BoxShadow(color:themeNotifier.value ? Colors.black : Colors.grey.withOpacity(0.2), blurRadius: 5),
          ],
        ),
        child: Row(
          children: imageOnLeft
              ? [imageWidget, const SizedBox(width: 16), textContent]
              : [textContent, const SizedBox(width: 16), imageWidget],
        ),
      ),
    );
  }Widget _buildNavButton(
    IconData icon,
    String label, {
    bool isActive = false,
    VoidCallback? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
         color: isActive ?  Color.fromARGB(255, 63, 150, 222) : themeNotifier.value ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color:  Color.fromARGB(255, 63, 150, 222), // الإطار باللون الأزرق
          width: 2, // سمك الإطار
        ),
      ),
      child: IconButton(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white :  Color.fromARGB(255, 63, 150, 222), // تغيير اللون إذا كان الزر نشطًا
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white :  Color.fromARGB(255, 63, 150, 222), // تغيير اللون إذا كان الزر نشطًا
                fontSize: 12,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}