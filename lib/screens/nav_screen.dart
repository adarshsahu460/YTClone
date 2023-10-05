import 'package:flutter/material.dart';
import 'package:ytclone/screens/explore.dart';
import 'package:ytclone/screens/home_screen.dart';
import 'package:ytclone/screens/library.dart';
import 'package:ytclone/screens/subs.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // This is the index for maintaining the navigation index of screens
  var _idx = 0;

  // These are the screens which will be appearing for each click of index on the navigation bar
  final _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const SubScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Doing this will re-render the screens from start,i.e., if we directly jump from home to library then the home 
         feed will get reset */
      // body: _screens[_idx],

      /* So what we do is that we create a stack widget and map the screens to store their current states i.e.,
        all the screens will be rendered in the background but only a single one will be visible */
      body: Stack(
        // Here we reference our _screens list to the Stack
        children: _screens

            // Now convert this list of screens to a map of screens
            .asMap()

            // Now we will set the index for each map element map <int,Screen> type
            .map(
              // So here for each index, we are rendering the _screen[i] using a thisScreenVar variable
              (i, thisScreenVar) => MapEntry(
                i,

                // Now use the index, Offstage widget for hiding the unnecessary screens and showing the necessary ones
                Offstage(
                  // So the below line means hide all those screens having index != i
                  offstage: _idx != i,

                  // And this line means show the thisScreenVar i.e., _screens[i]
                  child: thisScreenVar,
                ),
              ),
            )

            // Then for storing those, convert back to values and then to a list
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // This updates the index of NavigationBar
        currentIndex: _idx,

        // We used this so that the widgets remain black by default i.e., fixed and black
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,

        // This updates the value of _idx(which is a private variable) on click of the any of the bottom widgets
        onTap: (i) => setState(() {
          _idx = i;
        }),

        // The selected and unselected font size are refering to the click sizes and default sizes
        selectedFontSize: 10,
        unselectedFontSize: 10,

        // This is the items list, which contains the list of items in the bottom navigation bar
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: "Explore",
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              label: "Subscriptions",
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              label: "Library",
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library)),
        ],
      ),
    );
  }
}
