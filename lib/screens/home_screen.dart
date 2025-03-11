import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_management/screens/drawer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "Loading..."; // Default value to avoid empty UI

  final List<Map<String, dynamic>> dashboardData = [
    {
      "id": 1,
      "title": "Orders",
      "icon": Icons.shopping_cart,
      "background_color": Colors.blue,
    },
    {
      "id": 2,
      "title": "Products",
      "icon": Icons.shopping_bag,
      "background_color": Colors.green,
    },
    {
      "id": 3,
      "title": "Customers",
      "icon": Icons.people,
      "background_color": Colors.orange,
    },
    {
      "id": 4,
      "title": "Reports",
      "icon": Icons.bar_chart,
      "background_color": Colors.red,
    },
  ];

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');

    if (userData != null) {
      Map<String, dynamic> user = jsonDecode(userData);
      setState(() {
        name = user['name'] ?? "No Name";
      });
    } else {
      setState(() {
        name = "Guest"; // Fallback if no user data is found
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                title: Text(
                  name, // ✅ Dynamic name now updates correctly
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.all(30),
            children: [
              ...dashboardData
                  .map(
                    (data) => InkWell(
                      onTap: () {
                        print(data['id']);
                        print(data['title']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: data['background_color'],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                data['icon'],
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data['title'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          )
        ],
      ),
    );
  }
}
