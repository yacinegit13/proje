import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_signe/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'generated/l10n.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       color: themeNotifier.value ? Colors.black : Colors.white,

        child: SingleChildScrollView(
          
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 63, 150, 222)),
                onPressed: () {
          Navigator.pop(context);
                },
              ),
              const Text(
                /*S.of(context).introduction*/ "     Introduction", // Affiche "Bienvenue", "Welcome" ou "مرحبا"
          
                style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color:Color.fromARGB(255, 63, 150, 222),
                ),
              ),
            ],
          ),
          
                const SizedBox(height: 20),
                Text(
                  "Quiz Sign Language",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 63, 150, 222)
                ),),
                const SizedBox(height: 10),
                Text(
                  "PLAYING THE GAME AND LEARN",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 63, 150, 222)),
                ),
                const SizedBox(height: 3),
                Image.asset('images/PLAY.jpeg', height: 330),
                const SizedBox(height: 3),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 63, 150, 222),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "START PLAYING",
                    style: TextStyle(fontSize: 20, color: themeNotifier.value ? Colors.black : Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),





      
       bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: themeNotifier.value ? Colors.black : Colors.white,
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
               onPressed: () {
                 Navigator.pushNamed(context, '/homme');
              },
            ),
            _buildNavButton(
              Icons.quiz,
              'Quiz',
              isActive: true,
              onPressed: () {
                
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
        ),
      ),
    );
  }

  // ignore: unused_element
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

class Question {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String image;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.image,
  });
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int selectedIndex = -1;
  bool showResult = false;
  int score = 0;

  final List<Question> questions = [
    Question(
      question: 'What does this sign mean?',
      options: ['a) yes', 'b) NO', 'c) I love you'],
      correctIndex: 0,
      image: 'images/yes.jpeg',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) Good morning', 'b) Good by', 'c) I love you'],
      correctIndex: 0,
      image: 'images/q2.png',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) hello', 'b) you', 'c) dad'],
      correctIndex: 2,
      image: 'images/dad.gif',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) go', 'b) mam', 'c) by'],
      correctIndex: 1,
      image: 'images/MAM.jpeg',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) help', 'b) good', 'c) yes'],
      correctIndex: 0,
      image: 'images/help.webp',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) hi', 'b) go', 'c) thanks'],
      correctIndex: 2,
      image: 'images/THANK.jpeg',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) by', 'b) dont_like', 'c) like'],
      correctIndex: 1,
      image: 'images/dont_like.gif',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) big', 'b) what', 'c) small'],
      correctIndex: 0,
      image: 'images/OIP (1).jpeg',
    ),
    Question(
      question: 'What does this sign mean?',
      options: ['a) good', 'b) plaise', 'c) No'],
      correctIndex: 1,
      image: 'images/plaise.png',
    ),
  ];

  Future<void> saveScore(String userId, int score) async {
    final supabase = Supabase.instance.client;

    final response = await supabase.from('scores').insert({
      'user_id': userId,
      'score': score,
      'created_at': DateTime.now().toIso8601String(),
    });

    if (response.error != null) {
      print('❌ Error saving score: ${response.error!.message}');
    } else {
      print('✅ Score saved successfully!');
    }
  }

  void onNext() {
    if (!showResult) {
      if (selectedIndex == questions[currentQuestion].correctIndex) {
        setState(() => score++);
      }
      setState(() => showResult = true);
    } else {
      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
          selectedIndex = -1;
          showResult = false;
        });
      } else {
        final userId = Supabase.instance.client.auth.currentUser?.id;
        saveScore(userId ?? 'guest', score);

        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text("Quiz Finished!"),
                content: Text("Your score: $score/${questions.length}"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
        );
      }
    }
  }

  Color getBorderColor(int index) {
    if (!showResult) return Color.fromARGB(255, 63, 150, 222);

    if (index == questions[currentQuestion].correctIndex) {
      return Colors.green;
    }

    if (index == selectedIndex &&
        selectedIndex != questions[currentQuestion].correctIndex) {
      return Colors.red;
    }

    return Color.fromARGB(255, 63, 150, 222);
  }

  Widget buildOption(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: getBorderColor(index), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile<int>(
        title: Text(
          questions[currentQuestion].options[index],
          style: TextStyle(
            color:
                showResult && index == questions[currentQuestion].correctIndex
                    ? Colors.green
                    : null,
            fontWeight:
                showResult && index == questions[currentQuestion].correctIndex
                    ? FontWeight.bold
                    : null,
          ),
        ),
        value: index,
        groupValue: selectedIndex,
        onChanged: (value) {
          if (!showResult) {
            setState(() => selectedIndex = value!);
          }
        },
        activeColor: const Color.fromARGB(255, 63, 150, 222),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: themeNotifier.value ? Colors.black : Colors.white,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Padding(
            key: ValueKey(currentQuestion),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: themeNotifier.value ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Score: $score/${questions.length}",
                        style: const TextStyle(color: Color.fromARGB(255, 63, 150, 222)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 63, 150, 222), width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: themeNotifier.value ? Colors.black : const Color.fromARGB(221, 236, 206, 175),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.question,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(child: Image.asset(question.image, height: 150)),
                        const SizedBox(height: 12),
                        ...List.generate(question.options.length, buildOption),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: selectedIndex != -1 || showResult ? onNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 63, 150, 222),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    currentQuestion == questions.length - 1 && showResult
                        ? "Finish"
                        : "Next",
                    style: TextStyle(fontSize: 18, color: themeNotifier.value ? Colors.black : Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
