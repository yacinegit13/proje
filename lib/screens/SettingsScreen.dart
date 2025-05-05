import 'package:flutter/material.dart';
import 'package:projet_signe/main.dart';
// ignore: unused_import
import 'package:projet_signe/screens/about_us.dart';
// ignore: unused_import
import 'package:projet_signe/screens/theme_notifier.dart'; // chemin à adapter


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeNotifier.value ?   Colors.black : Colors.white,

      body: Column(
        children: [
          // HEADER
          Container(
            color: Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
            child: Row(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 63, 150, 222), size: 28),
      onPressed: () {
        Navigator.of(context).pop(); // ou pushNamed si tu préfères
      },
    ),
    const SizedBox(width: 8),
    const Icon(Icons.settings, color: Color.fromARGB(255, 63, 150, 222), size: 32),
    const SizedBox(width: 8),
    const Text(
      'Settings',
      style: TextStyle(
        color: Color.fromARGB(255, 63, 150, 222),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

          ),

          // PROFILE
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: themeNotifier.value ?   Colors.black : Colors.white,

            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    'images/edf.PNG',
                  ), // replace with your avatar
                ),
                SizedBox(height: 8),
                Text(
                  'Mon Nom',
                  style: TextStyle(
                    fontSize: 25,
                    color: themeNotifier.value ? Colors.white : Colors.black,

                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.25,
            color: Colors.grey,
            margin: EdgeInsets.only(top: 16, bottom: 8),
          ),
          // SETTINGS OPTIONS
          Expanded(
            child: ListView(
              children: [
                // Account Settings
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 4),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Edit profile',
                    style: TextStyle(
                      color: themeNotifier.value ? Colors.white : Colors.black,

                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pushNamed('/editprofile');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text(
                    'Privacy',
                    style: TextStyle(
                      color: themeNotifier.value ? Colors.white : Colors.black,

                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pushNamed('/changhe');
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Push notifications',
                    style: TextStyle(
                      color: themeNotifier.value ? Colors.white : Colors.black,

                    ),
                  ),
                  value: pushNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      pushNotifications = value;
                    });
                  },
                  activeColor: Color.fromARGB(255, 63, 150, 222),
                ),
                SwitchListTile(
  title: Text(
    'Dark mode',
    style: TextStyle(
      color: themeNotifier.value ? Colors.white : Colors.black,
    ),
  ),
  value: themeNotifier.value,
  onChanged: (bool value) {
    themeNotifier.toggleTheme(); // change globalement
    setState(() {}); // pour reconstruire localement si nécessaire
  },
  activeColor: Color.fromARGB(255, 63, 150, 222),
),

                Container(
                  height: 0.25,
                  color: Colors.grey,
                  margin: EdgeInsets.only(top: 16, bottom: 8),
                ),
                // More
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 4),
                  child: Text(
                    'More',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                ListTile(
                  title: Text(
                    'About us',
                    style: TextStyle(
                     color: themeNotifier.value ? Colors.white : Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pushNamed('/about_us');
                  },
                ),
                ListTile(
                  title: Text(
                    'Terms and conditions',
                    style: TextStyle(
                      color: themeNotifier.value ? Colors.white : Colors.black,

                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pushNamed('/terms_and_condition');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'log out',
                    style: TextStyle(
                      color: themeNotifier.value ? Colors.white : Colors.black,

                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
