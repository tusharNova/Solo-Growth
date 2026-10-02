import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';
import 'quest_screen.dart';
import 'status_screen.dart';

/// MainNavigationScreen: The root shell hosting the bottom navigation bar.
/// Allows the player to switch between the Status Window and Quest Log.
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      StatusScreen(
        onNavigateToQuests: () => _onTabTapped(1),
      ),
      const QuestScreen(),
    ];

    return Scaffold(
      backgroundColor: kBackground,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D121F),
          border: const Border(
            top: BorderSide(
              color: Color(0xFF1E293B),
              width: 1.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kNeonBlue,
          unselectedItemColor: kTextMuted,
          selectedLabelStyle: GoogleFonts.orbitron(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
          unselectedLabelStyle: GoogleFonts.rajdhani(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'STATUS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment_rounded),
              label: 'QUESTS',
            ),
          ],
        ),
      ),
    );
  }
}
