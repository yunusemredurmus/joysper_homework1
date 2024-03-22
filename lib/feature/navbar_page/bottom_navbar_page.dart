import 'package:flutter/material.dart';
import 'package:joysper_homework1/feature/home/screens/home_screen.dart';
import 'package:joysper_homework1/feature/home/screens/settings_screen.dart';
import 'package:joysper_homework1/feature/home/screens/staticks_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "İstatistik",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ayarlar",
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      return const HomeBody();
    } else if (_currentIndex == 1) {
      return const StaticsBody();
    } else {
      return const SettingsBody();
    }
  }
}
