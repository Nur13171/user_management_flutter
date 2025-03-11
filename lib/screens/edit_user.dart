import 'package:flutter/material.dart';
import 'package:user_management/screens/drawer_screen.dart';
import 'package:user_management/services/user_service.dart';

class EditUserPage extends StatefulWidget {
  final int userId;
  EditUserPage({required this.userId});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final response = await UserService.getUserDetails(widget.userId);
    if (response['success']) {
      setState(() {
        nameController.text = response['data']['name'];
        emailController.text = response['data']['email'];
        isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['error']), backgroundColor: Colors.red),
      );
      Navigator.pop(context);
    }
  }

  void _updateUser() async {
    final response = await UserService.updateUser(
      widget.userId,
      nameController.text,
      emailController.text,
    );
    if (response['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User updated successfully"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['error']),
          backgroundColor: Colors.red,
        ),
      );
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Edit User Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 15),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _updateUser,
                            child: Text("Update User",
                                style: TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
