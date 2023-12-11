import 'package:blog_app/Blogdata/bloginfo.dart';
import 'package:blog_app/bottomnavigator/add.dart';
import 'package:blog_app/bottomnavigator/settin.dart';
import 'package:blog_app/bottomnavigator/user.dart';
import 'package:flutter/material.dart';

class Bottombardata extends StatefulWidget {
  const Bottombardata({super.key});

  @override
  State<Bottombardata> createState() => _BottombardataState();
}

class _BottombardataState extends State<Bottombardata> {
  int selectedTabIndex = 0;
  List<Widget> pagesToNavigate = [
    BlogInfoPage(),
    UserDataPage(),
    AddDataPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        buildNavItem(Icons.home, 0),
        buildNavItem(Icons.verified_user_outlined, 1),
        buildNavItem(Icons.add, 2),
        buildNavItem(Icons.settings, 3),
      ],
      currentIndex: selectedTabIndex,
      onTap: (index) {
        setState(() {
          // Toggle the value of 'load' for the tapped icon
          selectedTabIndex = index;
        });
      },
    );
  }

  BottomNavigationBarItem buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          setState(() {
            // Set load to false for all icons except the tapped one
            selectedTabIndex = index;
            if (index < pagesToNavigate.length) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pagesToNavigate[index],
                  ));
            }
          });
        },
        child: Icon(
          icon,
          color: selectedTabIndex == index
              ? const Color.fromARGB(255, 170, 130, 239)
              : Colors.black,
        ),
      ),
      label: "",
    );
  }
}
