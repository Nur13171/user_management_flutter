import 'package:flutter/material.dart';
import 'package:user_management/screens/drawer_screen.dart';
import 'package:user_management/screens/edit_user.dart';
import 'package:user_management/services/user_service.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<Map<String, dynamic>> _userListFuture;

  @override
  void initState() {
    super.initState();
    _userListFuture = UserService.userList();
  }

  void _refreshUserList() {
    setState(() {
      _userListFuture = UserService.userList();
    });
  }

  void _confirmDelete(int userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                _deleteUser(userId); // Proceed with deletion
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(int userId) async {
    final response = await UserService.deleteUser(userId);
    if (response["success"]) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response["message"]),
          backgroundColor: Colors.green,
        ),
      );
      _refreshUserList();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response["error"]),
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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!['success']) {
            List<dynamic> data = snapshot.data!['data'];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var user = data[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(user['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(user['email'],
                        style: TextStyle(color: Colors.grey[600])),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditUserPage(userId: user['id']),
                              ),
                            );
                            _refreshUserList();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmDelete(user['id']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
