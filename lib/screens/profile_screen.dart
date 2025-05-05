import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_signe/component/my_buttons.dart';
import 'package:projet_signe/component/textfield.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String email;

  const ProfileScreen({super.key, required this.username, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;

  String selectedAvatar = "images/edf.PNG";

  final List<String> avatars = [
    "images/avatar1.jpg",
    "images/avatar2.avif",
    "images/avatar3.webp",
    "images/avatar4.avif",
    "images/avatar5.png",
    "images/avatar6.avif",
    "images/avatar7.webp",
    "images/avatar8.avif",
    "images/avatar9.jpeg",
    "images/avatar10.jpeg",
    "images/avatar11.avif",
    "images/avatar12.avif",
    "images/avatar13.jpeg",
  ];

  @override
  void initState() {
    super.initState();

    var names = widget.username.split(' ');
    _firstNameController = TextEditingController(text: names[0]);
    _lastNameController = TextEditingController(
      text: names.length > 1 ? names[1] : '',
    );
    _emailController = TextEditingController(text: widget.email);
  }

  void _showAvatarSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose a profile picture",selectionColor:  Color.fromARGB(255, 63, 150, 222)),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: avatars.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAvatar = avatars[index];
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(avatars[index]),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("cancellation"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(color:  Color.fromARGB(255, 63, 150, 222), fontWeight: FontWeight.bold),),
        backgroundColor:  Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:  Color.fromARGB(255, 63, 150, 222)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color:  Color.fromARGB(255, 63, 150, 222)),
            onPressed: () {
              Navigator.pushNamed(context, '/parametre');
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Open settings")));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color:  Color.fromARGB(255, 63, 150, 222),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: _showAvatarSelectionDialog,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.username,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "welcome", // Affiche "Bienvenue", "Welcome" ou "مرحبا"

              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "First Name",
              controller: _firstNameController,
              readOnly: false,
            ),
            CustomTextField(
              label: "Last Name",
              controller: _lastNameController,
              readOnly: false,
            ),
            CustomTextField(
              label: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              readOnly: true,
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: "saved",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Registration completed successfully! ✅")),
                );

                Navigator.pushNamed(context, '/selectuser');
              },
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: "Log Out",
              // ignore: avoid_print
              onPressed: () => print("Logged Out"),
              color: Colors.red,
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
              isActive: false,
              onPressed: (){
                 Navigator.pushNamed(context, '/coures');
              },
            ),
            _buildNavButton(
              Icons.person,
              'Profile',
              isActive: true,
              onPressed: () {
                
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
    return Container(
      decoration: BoxDecoration(
         color: isActive ?  Color.fromARGB(255, 63, 150, 222) : Colors.white,
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