import 'package:flutter/material.dart';
import 'package:projet_signe/main.dart';


class FhamniHomePage extends StatefulWidget {
  const FhamniHomePage({super.key});

  @override
  State<FhamniHomePage> createState() => _FhamniHomePageState();
}

class _FhamniHomePageState extends State<FhamniHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tabContents = [
    const IdeaTab(),
    const VolunteersTab(),
    const TechnicalSupportTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us', style: TextStyle(color: themeNotifier.value ? Colors.white : Colors.black,)),
        backgroundColor: themeNotifier.value ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: themeNotifier.value ? Colors.white : Colors.black,),
        actions: [
         /* IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Navigate back or to next page
            },
          ),*/
        ],
      ),
      body: Column(
        children: [
          _buildCustomTabBar(),
          Expanded(
            child: _tabContents[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: themeNotifier.value ? Colors.black : Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('The Idea', Icons.lightbulb_outline, 0),
          _buildTabItem('Volunteers', Icons.volunteer_activism, 1),
          _buildTabItem('Privacy Policy', Icons.privacy_tip, 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4.5,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.black87,
              size: 24,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class IdeaTab extends StatelessWidget {
  const IdeaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '"Fhamni" app is the voice of the deaf to the world. It aims to facilitate the lives of the deaf by enabling dual communication between people with hearing disabilities and the hearing population in a simple way.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'It aims to:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          _buildNumberedItem(
            '1. Change how the deaf communicate with society and reduce their dependence on others. Enable communication freely, making them active members of society.',
            context,
          ),
          const SizedBox(height: 15),
          _buildNumberedItem(
            '2. Help them overcome the challenge of Arabic language weakness.',
            context,
          ),
          const SizedBox(height: 15),
          _buildNumberedItem(
            '3. Integrate them into society, benefit from their skills, and employ their human potential.',
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedItem(String text, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );
  }
}

class VolunteersTab extends StatelessWidget {
  const VolunteersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Volunteers in the Fhamni App to Enrich Unified Arabic Sign Content:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
           // Image centered in the screen
          Center(
            child: Image.asset(
              'images/vvv.jpg', // chemin relatif dans le dossier assets
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),
          /*_buildVolunteerItem(
            '• Deaf individuals and members of the Imkan Association for the Hearing Impaired.',
            context,
          ),
          const SizedBox(height: 15),
          _buildVolunteerItem(
            '• Deaf students from special education schools and members of Al-Amal Institute (primary to high school).',
            context,
          ),
          const SizedBox(height: 15),
          _buildVolunteerItem(
            '• A deaf team from Khadijah Mosque in Jeddah, led by Ms. Saleha Al-Ghamdi.',
            context,
          ),*/
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildVolunteerItem(String text, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );
  }
}

class TechnicalSupportTab extends StatelessWidget {
  const TechnicalSupportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Privacy Policy\n\nIntroduction',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            'This Privacy Policy explains how our app [Fhamni] collects, uses, and discloses your personal information when you use our mobile application, available on Android and iOS devices. We are committed to protecting your privacy and ensuring you understand how your information is handled.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 25),
          Text(
            'Information We Collect',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We collect two types of information through the app:\n\n'
            '1. Non-Personal Information:\n'
            '   - Device Information: Device model, operating system, unique device identifiers, and network information.\n'
            '   - Usage Data: How you interact with the app (e.g., features used, frequency of use, crash logs to improve app stability).\n'
            '   - Aggregated Data: Anonymous information combined from multiple users to analyze general usage trends.\n\n'
            '2. Optional Personal Information:\n'
            '   - Your name (for personalization).\n'
            '   - App settings preferences (e.g., language options).',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 25),
          Text(
            'Use of Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We use the collected information for the following purposes:\n'
            '- To provide and improve the app.\n'
            '- To analyze usage trends.\n'
            '- To communicate with you.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 25),
          Text(
            'Sharing Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We will not sell or rent your personal information to third parties. We may share non-personal information with trusted service providers who assist us in operating the app. These providers are bound by confidentiality agreements.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 25),
          Text(
            'Data Security',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We take reasonable steps to protect your information. However, no electronic storage or internet transmission method is 100% secure.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 25),
          Text(
            'Your Choices',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'You can control how your device shares information by adjusting your device’s privacy settings.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 25),
          Text(
            'Changes to the Privacy Policy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We may update this Privacy Policy occasionally. You will be notified of changes via the updated policy posted on the app.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}