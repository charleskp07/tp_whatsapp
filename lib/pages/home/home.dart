import 'package:flutter/material.dart';
import 'package:whatsapp/pages/home/call.dart';
import 'package:whatsapp/pages/home/community.dart';
import 'package:whatsapp/pages/home/discussion.dart';
import 'package:whatsapp/pages/home/story.dart';
import 'package:whatsapp/pages/users/create.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homePages = [
    DiscussionPage(),
    StoryPage(),
    CommunityPage(),
    CallPage(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homePages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.message),
            label: "Discussions",
          ),

          NavigationDestination(
            icon: Icon(Icons.filter_tilt_shift),
            label: "Actus",
          ),

          NavigationDestination(icon: Icon(Icons.groups), label: "Communautés"),

          NavigationDestination(icon: Icon(Icons.call), label: "Appels"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateUserScreen()),
          );
        },
      ),
    );
  }
}
