import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_management/screens/add_user.dart';
import 'package:user_management/screens/loging_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = -1; // To track selected menu item
  String name = ""; // Default text before fetching data
  String email = "";

  @override
  void initState() {
    super.initState();
    loadUserData(); // Fetch user data from SharedPreferences
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove token & user data
    await prefs.remove('token');
    await prefs.remove('user');

    // Navigate to login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LogingScreen()),
      (route) => false, // Clear navigation stack
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Cancel
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                logout(context); // Perform logout
              },
              child: Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userData = prefs.getString('user');
    if (userData != null) {
      Map<String, dynamic> user = jsonDecode(userData);

      setState(() {
        name = user['name'] ?? "No Name";
        email = user['email'] ?? "No Email";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image with Border
                Container(
                  padding: EdgeInsets.all(4), // Border padding
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.grey.shade400, width: 2), // Grey border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                ),

                SizedBox(width: 12),

                // Name & Email Section
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              children: [
                buildMenuItem(0, "Home", Icons.home),
                buildMenuItem(1, "Profile", Icons.person),

                // Expandable Submenu
                ExpansionTile(
                  leading: const Icon(Icons.people, color: Colors.black87),
                  title: const Text(
                    "Users",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  children: [
                    buildSubMenuItem("Add User", Icons.person_add,
                        page: AddUserPage(), context: context),
                    buildSubMenuItem("User List", Icons.list,
                        page: AddUserPage(), context: context),
                  ],
                ),

                // Expandable Submenu
                ExpansionTile(
                  leading: Icon(Icons.settings, color: Colors.black87),
                  title: Text("Settings",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  children: [
                    buildSubMenuItem("Account", Icons.account_circle),
                    buildSubMenuItem("Privacy", Icons.lock),
                    buildSubMenuItem("Notifications", Icons.notifications),
                  ],
                ),

                buildMenuItem(2, "Help", Icons.help),
                buildMenuItem(3, "Logout", Icons.exit_to_app),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Regular Menu Item
  Widget buildMenuItem(int index, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon,
          color: selectedIndex == index ? Colors.blueAccent : Colors.black87),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: selectedIndex == index ? Colors.blueAccent : Colors.black87),
      ),
      onTap: () {
        if (title == "Logout") {
          _confirmLogout();
        } else {
          setState(() {
            selectedIndex = index;
          });
          Navigator.pop(context); // Close drawer
        }
      },
    );
  }

  // Submenu Item
  Widget buildSubMenuItem(String title, IconData icon,
      {Widget? page, BuildContext? context}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade700, size: 20),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade800),
      ),
      onTap: () {
        if (page != null && context != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    page), // Navigate only if page is provided
          );
        }
      },
    );
  }
}
