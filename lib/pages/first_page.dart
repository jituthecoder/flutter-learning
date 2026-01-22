import "package:flutter/material.dart";
import "package:flutter_application_1/pages/home_page.dart";
import "package:flutter_application_1/pages/profile_page.dart";
import "package:flutter_application_1/pages/second_page.dart";
import "package:flutter_application_1/pages/settings_page.dart";

class FirstPage extends StatefulWidget{
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // This keeps track of the current page
  int _selectedIndex = 0;

	void _navigateBottomBar(int index){
		setState(() {
		  _selectedIndex = index;
		});
	}

  final List _pages = [
    // home page
    HomePage(),

    // Profile page
    ProfilePage(),

    // Settings page
    SettingsPage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1st Page")),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
		currentIndex: _selectedIndex,
		onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ]
        ),
    );
  }
}