import 'package:flutter/material.dart';
import 'package:mealsappflutter/models/meal.dart';
import '../widgets/category_meal_widget.dart';
import '../models/dummy_categories.dart';

class SubCategoryMealsScreen extends StatefulWidget {
//  final String mainCatId;
//  final String catMainTitle;
//  SubCategoryMealsScreen({this.catMainTitle,this.mainCatId});

  static const routeName = '/categories-meal-screen';
  final List<Meal> _availableMeals;

  SubCategoryMealsScreen(this._availableMeals);

  @override
  _SubCategoryMealsScreenState createState() => _SubCategoryMealsScreenState();
}

class _SubCategoryMealsScreenState extends State<SubCategoryMealsScreen> {
  String cattitle;
  String catid;
  List<Meal> filteredCategoryItems;
  var _loadedData = false;

  //we cant pass statements where context is use in intistate so we should do it on didchangedependencies
  //it als calls before build call but its called when our widget is fully initiazlized.
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedData) {
      final routeArgsCatItemData =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catid = routeArgsCatItemData['id'];
      cattitle = routeArgsCatItemData['title'];
      filteredCategoryItems = widget._availableMeals.where((meal) {
        return meal.categories.contains(catid);
      }).toList();
      _loadedData = true;
    }
  }

  void removeItemFromList(String mealId) {
    setState(() {
      filteredCategoryItems.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cattitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return CategoryMealWidget(
              mealId: filteredCategoryItems[index].id,
              title: filteredCategoryItems[index].title,
              imageUrl: filteredCategoryItems[index].imageUrl,
              duration: filteredCategoryItems[index].duration,
              affordability: filteredCategoryItems[index].affordability,
              complexity: filteredCategoryItems[index].complexity,
              removeItem: removeItemFromList,
            );
          },
          itemCount: filteredCategoryItems.length,
        ));
  }
}
