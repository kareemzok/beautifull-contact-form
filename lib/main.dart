import 'package:flutter/material.dart';

import 'Home.dart';
import 'Contact/ContactUsForm.dart';
import 'Settings/Settings.dart';
import 'Contact/HomeButton.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _counter = 0;
  double screenWidth = 600;
  double screenHeight = 400;
  int _selectedIndex = 0;
  late TabController _tcontroller;

  final List<String> bottomNavTitle = ['Home', 'Contact us', 'Settings'];
  late String currentTitle;


  @override
  void initState() {

    currentTitle = 'Home';
    _tcontroller = TabController(initialIndex: 0, length: 3, vsync: this);
    _tcontroller.addListener(changeTitle); // Registering listener

    super.initState();
  }

  // This function is called, every time active tab is changed
  void changeTitle() {
    setState(() {
      // get index of active tab & change current appbar title
      currentTitle = bottomNavTitle[_tcontroller.index];
    });
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    const List<Widget> _pages = <Widget>[
      HomePage(),
      ContactUsForm(),
      SettingPage(),
    ];


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _pages.elementAt(_selectedIndex),


      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.white!, // tab button ripple color when pressed
                hoverColor: Colors.purple[700]!, // tab button hover color
                haptic: true, // haptic feedback
                tabBorderRadius: 15,
                tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
                tabBorder: Border.all(color: Colors.purple, width: 1), // tab button border
                tabShadow: [BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 900), // tab animation duration
                gap: 8, // the tab button gap between icon and text
                color: Colors.grey[800], // unselected icon color
                activeColor: Colors.purple, // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: bottomNavTitle.elementAt(0),
                  ),
                  GButton(
                    icon: Icons.email,
                    text: bottomNavTitle.elementAt(1),
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: bottomNavTitle.elementAt(2),
                  ),

                ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                  currentTitle = bottomNavTitle[index];

                  developer.log('index: $index');
                });
              },

            )

          ),
        ),
      ),
    );
  }
}
