import 'package:flutter/material.dart';
import 'package:mealsappflutter/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function filtersmethod;
  final Map<String,bool> filtersMap;

  FiltersScreen({this.filtersmethod,this.filtersMap});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVeganFree = false;
  var _isVegeterianFree = false;
  var _isLactoseFree = false;



  Widget returnSwitchListTile(
      String title, String subtitle, bool item, Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: item,
      onChanged: updatevalue,
    );
  }

  @override
  void initState() {
    _isGlutenFree = widget.filtersMap['gluten'];
    _isLactoseFree = widget.filtersMap['lactose'];
    _isVeganFree = widget.filtersMap['vegan'];
    _isVegeterianFree = widget.filtersMap['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _selectedfilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVeganFree,
                'vegetarian': _isVegeterianFree,
              };

              widget.filtersmethod(_selectedfilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                returnSwitchListTile(
                    'Gluten-Free', 'Only Gluten-Free meals', _isGlutenFree,
                    (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                returnSwitchListTile(
                    'Lactose-Free', 'Only Lactose-Free meals', _isLactoseFree,
                    (newval) {
                  setState(() {
                    _isLactoseFree = newval;
                  });
                }),
                returnSwitchListTile(
                    'Vegetarain', 'Only Vegetarain meals', _isVegeterianFree,
                    (newval) {
                  setState(() {
                    _isVegeterianFree = newval;
                  });
                }),
                returnSwitchListTile('Vegan', 'Only Vegan meals', _isVeganFree,
                    (newval) {
                  setState(() {
                    _isVeganFree = newval;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
