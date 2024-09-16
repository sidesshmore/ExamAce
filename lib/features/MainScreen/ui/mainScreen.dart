import 'package:examace/features/Bookmark/ui/bookmark.dart';
import 'package:examace/features/Chapters/ui/chapters.dart';
import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/Profile/ui/settings.dart';
import 'package:examace/features/Subjects/ui/subjects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 1;
  final List<Widget> _widgetOptions = [
    const Bookmark(),
    const Chapters(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.bookmark_border, 0, height * 0.04),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.chat_bubble_text, 1, height * 0.04),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person_outline, 2, height * 0.04),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xffFEBA04),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index, double size) {
    double selectedSize = size * (_selectedIndex == index ? 1.1 : 1);
    double translateY = _selectedIndex == index ? -2.0 : 0.0;

    return Transform.translate(
      offset: Offset(0, translateY),
      child: Transform.scale(
        scale: _selectedIndex == index
            ? 1
            : 0.9, // Increase size for selected item
        child: Icon(
          icon,
          size: selectedSize,
        ),
      ),
    );
  }
}
