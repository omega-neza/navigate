import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'NavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static final List<Widget> _widgetOption = <Widget>[
    Container(
      color: Color.fromARGB(255, 6, 141, 85),
      child: const Center(
        child: Text(
          "Gallery",
          style: optionStyle,
        ),
      ),
    ),
    Container(
      color: const Color.fromARGB(255, 135, 140, 210),
      child: const Center(
        child: Text(
          "explore",
          style: optionStyle,
        ),
      ),
    ),
    Container(
      color: const Color.fromARGB(255, 171, 210, 215),
      child: const Center(
        child: Text(
          "Calculator",
          style: optionStyle,
        ),
      ),
    ),
  
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text("Navigation Bar"),
        ),
        body: Center(
          child: _widgetOption.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.blueGrey.withOpacity(0.1),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[300]!,
                  gap: 7,
                  activeColor: const Color.fromARGB(255, 174, 192, 224),
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: LineIcons.enviraGallery,
                      text: "gallery",
                    ),
                    GButton(
                      icon: LineIcons.internetExplorer,
                      text: "explore",
                    ),
                    GButton(
                      icon: LineIcons.calculator,
                      text: "Calculator",
                    ),
                   
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
