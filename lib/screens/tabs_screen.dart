import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favMeals;

  TabsScreen({this.favMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favMeals), 'title': 'Your Favorites'}
    ];
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
//        type: BottomNavigationBarType.shifting,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
//            backgroundColor: Theme.of(context).primaryColor, for type = shifting
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
//            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

//Default tab controller bottom of the appbar.
//DefaultTabController(
//      length: 2,
////      initialIndex: 1,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Meals'),
//          bottom: TabBar(
//            tabs: <Widget>[
//              Tab(
//                icon: Icon(Icons.category),
//                text: 'Categories',
//              ),
//              Tab(
//                icon: Icon(Icons.favorite),
//                text: 'Favorites',
//              ),
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: <Widget>[
//            CategoriesScreen(),
//            FavoritesScreen(),
//          ],
//        ),
//      ),
//    );
