import 'package:flutter/material.dart';
import 'package:tugasuas/pages/welcome_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 111, 111, 111),
                  child: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    size: 50,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Brandon Alexander Jayadi',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Edit Profile'),
            leading: Icon(Icons.group),
            onTap: () {},
          ),
          ListTile(
            title: Text('History'),
            leading: Icon(Icons.rate_review),
            onTap: () {},
          ),
          ListTile(
            title: Text('Customer Service'),
            leading: Icon(Icons.help_outline),
            onTap: () {},
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
