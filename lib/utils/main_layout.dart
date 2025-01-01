import 'package:doctor_app/screens/appointment_page.dart';
import 'package:doctor_app/screens/home_page.dart';
import 'package:doctor_app/screens/rsow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children: const <Widget>[
          HomePage(),
          AppointmentPage(),
          RsowPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (page) {
            setState(() {
              currentPage:
              page;
              _page.animateToPage(
                page,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
                label: 'Appointment'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.heart),
                label: 'Rsow'),
          ]),
    );
  }
}
