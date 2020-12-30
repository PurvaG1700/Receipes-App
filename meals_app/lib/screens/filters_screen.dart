import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName= '/filter-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter Screen"),),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Filter Screen"),
      ),
      
    );
  }
}