import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/browse.dart';
import 'package:unearthed/screens/home/home.dart';
import 'package:unearthed/screens/profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final _pages = [
    Home(),
    Center(child: Text('Browse'),),
    Center(child: Text('Favourites'),),
    Center(child: Text('Profile'),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos/unearthed_collections.png', 
                 height: 300,
                                    ),
              ]),
      ),

      // body: _pageOptions[selectedBottomIcon],
      // body: Navigator(
      //   onGenerateRoute: (settings) {
      //     Widget page = Home();
      //     if (settings.name == 'Profile') page = Profile();
      //     return MaterialPageRoute(builder: (_) => Home());
      //   },
      // ),
      body: _pages[_pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
    );
  }
}