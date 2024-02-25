import 'package:flutter/material.dart';

class TabBarCustom extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> children;
  const TabBarCustom({required this.tabs, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            TabBar(
              tabs: tabs,
              labelStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold
              ),
              onTap: (value){},
              indicatorSize: TabBarIndicatorSize.label,

              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,

            ),

            Expanded(
                child: TabBarView(
                    children: children)),
          ],
        ));
  }
}
