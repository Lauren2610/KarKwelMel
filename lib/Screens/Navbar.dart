import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Constants.dart';

import 'Setting.dart';

import 'Navbar.dart';
import 'HomeScreen.dart';
import 'Donation_page.dart';
import 'Q&A.dart';
import 'Education.dart';

class Navbar extends StatefulWidget {
  static const String id = 'NavbarScreen';

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  int _selectedpage = 0;
  int changepage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          "ကာကွယ်မယ်",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              onpageChanged(index);
            });
          },
          children: [
            HomePage(),
            QA(),
            Education(),
            Donation(),
            SettingScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            _pageController!.jumpToPage(index);
          });
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.question_answer, color: Colors.white),
          Icon(Icons.school),
          Icon(Icons.attach_money, color: Colors.white),
          Icon(Icons.settings),
        ],
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        color: mainkythwycolor,
      ),
    );
  }

  onpageChanged(int index) {
    _selectedpage = index;
  }
}
