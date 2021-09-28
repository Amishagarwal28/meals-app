import 'package:flutter/material.dart';
import 'package:flutter5_responsive/screen/categories_screen.dart';
import 'package:flutter5_responsive/screen/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>_pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(),'title' :'Categories'},
    {'page': FavouritesScreen(widget.favouriteMeals),'title':'Favourites'}];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
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
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('categories'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('favourites'),
              backgroundColor: Theme.of(context).primaryColor),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
