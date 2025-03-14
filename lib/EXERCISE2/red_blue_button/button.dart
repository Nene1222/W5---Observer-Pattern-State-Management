import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    ),
  );
}

enum CardType { red, blue }

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  int redTapCount = 0;
  int blueTapCount = 0;

  void _incrementRedTapCount() {
    setState(() {
      redTapCount++;
    });
  }

  void _incrementBlueTapCount() {
    setState(() {
      blueTapCount++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//add da screen
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      TapsScreen(
        redTapCount: redTapCount,
        blueTapCount: blueTapCount,
        incrementRedTapCount: _incrementRedTapCount,
        incrementBlueTapCount: _incrementBlueTapCount,
      ),
      StatisticsScreen(
        redTaps: redTapCount,
        blueTaps: blueTapCount,
      ),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TapsScreen extends StatelessWidget {
  final int redTapCount;
  final int blueTapCount;
  final VoidCallback incrementRedTapCount;
  final VoidCallback incrementBlueTapCount;

  const TapsScreen({
    super.key,
    required this.redTapCount,
    required this.blueTapCount,
    required this.incrementRedTapCount,
    required this.incrementBlueTapCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Taps Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ColorTap(
          type: CardType.red,
          onTap: incrementRedTapCount,
          tapCount: redTapCount,
        ),
        ColorTap(
          type: CardType.blue,
          onTap: incrementBlueTapCount,
          tapCount: blueTapCount,
        ),
      ],
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final int redTaps;
  final int blueTaps;

  const StatisticsScreen({
    super.key,
    required this.redTaps,
    required this.blueTaps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Statistics Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: $redTaps', style: TextStyle(fontSize: 24)),
                Text('Blue Taps: $blueTaps', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}