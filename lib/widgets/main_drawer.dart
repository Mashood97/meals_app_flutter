import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData iconData, String title, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Roboto Condensed',
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            color: Colors.black54,
          ),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
