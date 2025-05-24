/*import 'package:flutter/material.dart';
import 'package:projet_signe/screens/Mycours.dart';
import 'package:projet_signe/screens/Quizz.dart';
import 'package:projet_signe/screens/lesson_card.dart';
import 'package:projet_signe/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 173, 184),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [      
            const SizedBox(height: 20),
           Row(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back, size: 28),
      onPressed: () {
        Navigator.of(context).pop(); // revenir à l'écran précédent
      },
    ),
    const SizedBox(width: 8),
    const Text(
      'Sign Language Lessons',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ],
),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildVerticalButtonGroup(
                  context,
                  mainButton: 'All Lessons',
                  subButton: 'New Lessons',
                  isMainActive: true,
                ),
                _buildVerticalButtonGroup(
                  context,
                  mainButton: 'Most Watched',
                  subButton: 'Advance',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  LessonCard(
                    title: ' Alphabet letters with signs',
                    duration: '10 min',
                    image: 'images/vds.PNG',
                  ),
                  LessonCard(
                    title: 'Daily communication signals',
                    duration: '15 min',
                    image: 'images/mn.PNG',
                  ),
                ],
              ),
            ),
          ],
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
            _buildNavButton(Icons.home_filled, 'Home', isActive: true),
            _buildNavButton(
              Icons.quiz,
              'Quiz',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StartPage()),
                );
              },
            ),
            _buildNavButton(
              Icons.text_fields,
              'Aa',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyCoursesScreen()),
                );
              },
            ),
            _buildNavButton(
              Icons.person,
              'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => const ProfileScreen(
                          username: 'belaidi',
                          email: 'belaidizineb@gmail.com',
                        ),
                  ),
                );
              },
            ),
          ],
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
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isActive ? Colors.blue : Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed ?? () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  static Widget _buildVerticalButtonGroup(
    BuildContext context, {
    required String mainButton,
    required String subButton,
    bool isMainActive = false,
  }) {
    return Column(
      children: [
        _buildCategoryButton(context, mainButton, isActive: isMainActive),
        const SizedBox(height: 8),
        _buildCategoryButton(context, subButton),
      ],
    );
  }

  static Widget _buildCategoryButton(
    BuildContext context,
    String text, {
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.blue : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MyCoursesScreen()),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
*/







import 'package:flutter/material.dart';
import 'package:projet_signe/main.dart';
import 'package:projet_signe/screens/Mycours.dart';
//import 'package:projet_signe/screens/Quizz.dart';
import 'package:projet_signe/screens/lesson_card.dart';
//import 'package:projet_signe/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  themeNotifier.value ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [      
            const SizedBox(height: 20),
           Row(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 63, 150, 222), size: 25),
      onPressed: () {
        Navigator.pushNamed(context, '/start'); // revenir à l'écran précédent
      },
    ),
    const SizedBox(width: 8),
    const Text(
      'Sign Language Lessons',
      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 63, 150, 222),),
    ),
  ],
),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildVerticalButtonGroup(
                  context,
                  mainButton: 'All Lessons',
                  subButton: 'New Lessons',
                  isMainActive: true,
                ),
                _buildVerticalButtonGroup(
                  context,
                  mainButton: 'Most Watched',
                  subButton: 'Advance',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 27,
                crossAxisSpacing: 44,
                children: [
                  LessonCard(
                    title: ' Alphabet letters with signs',
                    duration: '',
                    image: 'images/vds.PNG',
                  ),
                  LessonCard(
                    title: 'Daily communication signals',
                    duration: '',
                    image: 'images/mn.PNG',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),




      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: themeNotifier.value ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: themeNotifier.value ? Colors.black : Colors.grey.withOpacity(0.2),
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
              isActive: true,
               onPressed: () {
                 
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
              isActive: false,
              onPressed: () {
                 Navigator.pushNamed(context, '/coures');
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
           /* _buildNavButton(Icons.home_filled, 'Home', isActive: true),
            _buildNavButton(
              Icons.quiz,
              'Quiz',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StartPage()),
                );
              },
            ),
            _buildNavButton(
              Icons.text_fields,
              'Aa',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyCoursesScreen()),
                );
              },
            ),
            _buildNavButton(
              Icons.person,
              'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => const ProfileScreen(
                          username: 'belaidi',
                          email: 'belaidizineb@gmail.com',
                        ),
                  ),
                );
              },
            ),
          ],*/
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
 
   /* return TextButton(
      style: TextButton.styleFrom(
              foregroundColor: isActive ? Colors.white : const Color.fromARGB(255, 63, 150, 222),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: const Color.fromARGB(255, 63, 150, 222), width: 2), // إطار أزرق
      backgroundColor: isActive ? const Color.fromARGB(255, 63, 150, 222) : Colors.white,
      ),
      onPressed: onPressed ?? () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28,   color: isActive ? Colors.white : Color.fromARGB(255, 63, 150, 222),),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: isActive ? Colors.white : Color.fromARGB(255, 63, 150, 222),),
          ),
        ],
      ),
    );*/
  

  static Widget _buildVerticalButtonGroup(
    BuildContext context, {
    required String mainButton,
    required String subButton,
    bool isMainActive = false,
  }) {
    return Column(
      children: [
        _buildCategoryButton(context, mainButton, isActive: isMainActive),
        const SizedBox(height: 8),
        _buildCategoryButton(context, subButton),
      ],
    );
  }

  static Widget _buildCategoryButton(
    BuildContext context,
    String text, {
    bool isActive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeNotifier.value ? Colors.black : Colors.white,
         side: const BorderSide(color: Color.fromARGB(255, 63, 150, 222), width: 2),
        foregroundColor: const Color.fromARGB(255, 63, 150, 222),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MyCoursesScreen()),
          );
        },
        child: Text(
          text,
          style: TextStyle(
                  color: const Color.fromARGB(255, 63, 150, 222),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}