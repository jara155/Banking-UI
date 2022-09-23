import 'package:banking/pages/profile.dart';
import 'package:banking/pages/dashboard.dart';
import 'package:banking/pages/payments.dart';
import 'package:banking/pages/sendmoney.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int aktualniIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: aktualniIndex,
          onTap: (index) {
            setState(() {
              aktualniIndex = index;
              _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.dashboard_outlined, color: Colors.red),
              icon: Icon(
                Icons.dashboard_outlined,
                color: Colors.black,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.payments_outlined, color: Colors.red),
                icon: Icon(
                  Icons.payments_outlined,
                  color: Colors.black,
                ),
                label: "Transactions"
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.send_outlined, color: Colors.red),
                icon: Icon(
                  Icons.send_outlined,
                  color: Colors.black,
                ),
                label: "Send"
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.person_outline_outlined, color: Colors.red),
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.black,
                ),
                label: "Profile"
            ),
          ]
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            aktualniIndex = index;
          });
        },
        children: [
          Dashboard(),
          Payments(),
          SendMoney(),
          Profile(),
        ],
      ),
    );
  }
}
