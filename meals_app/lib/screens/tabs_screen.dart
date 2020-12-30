import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'favourites_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(),
      'title': 'Your Favourite',
    },
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex =
          index; //setSate as soon as the selected index changes then the body associated also changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, //in order to perform the action on selecting a tab . The index is automatically passed
        backgroundColor:
            Theme.of(context).primaryColor, //background color of the nav bar
        unselectedItemColor: Colors.white, //unselected item color
        selectedItemColor: Theme.of(context).accentColor, //selected item color
        currentIndex:
            _selectedPageIndex, //for the selected one to change color we need to tell the index of current actiive tab

        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
