import 'package:flutter/material.dart';
import '../widgets/category_meal_widget.dart';
import '../models/dummy_categories.dart';

class SubCategoryMealsScreen extends StatelessWidget {
//  final String mainCatId;
//  final String catMainTitle;
//  SubCategoryMealsScreen({this.catMainTitle,this.mainCatId});

  static const routeName = '/categories-meal-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgsCatItemData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String catid = routeArgsCatItemData['id'];
    final String cattitle = routeArgsCatItemData['title'];
    final filteredCategoryItems = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catid);
    }).toList();
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
            );
          },
          itemCount: filteredCategoryItems.length,
        ));
  }
}
