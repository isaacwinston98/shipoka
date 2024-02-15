import 'package:flutter/material.dart';

class WidgetTesting extends StatefulWidget {
  const WidgetTesting({super.key});

  @override
  State<WidgetTesting> createState() => _WidgetTestingState();
}

class _WidgetTestingState extends State<WidgetTesting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Adjust the border radius as needed
              ),
              color: Colors.blue, // Adjust the color of the indicator
            ),
            tabs: [
              Tab(child: Text('Tab 1')), // Customize the text as needed
              Tab(child: Text('Tab 2')),
              Tab(child: Text('Tab 3')),
              Tab(child: Text('Tab 4')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Add your tab views here
            Container(child: Center(child: Text('Tab 1 content'))),
            Container(child: Center(child: Text('Tab 2 content'))),
            Container(child: Center(child: Text('Tab 3 content'))),
            Container(child: Center(child: Text('Tab 4 content'))),
          ],
        ),
      ),
    );
  }
}
