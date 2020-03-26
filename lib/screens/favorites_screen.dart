import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/category_meal_widget.dart';
class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  FavoritesScreen(this.favoriteMeal);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet- start adding some'),

      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryMealWidget(
            mealId: widget.favoriteMeal[index].id,
            title: widget.favoriteMeal[index].title,
            imageUrl: widget.favoriteMeal[index].imageUrl,
            duration: widget.favoriteMeal[index].duration,
            affordability: widget.favoriteMeal[index].affordability,
            complexity: widget.favoriteMeal[index].complexity,
          );
        },
        itemCount: widget.favoriteMeal.length,
      );
    }
  }
}
