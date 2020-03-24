import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail-screen';

  @override
  Widget build(BuildContext context) {
    final mealid =ModalRoute.of(context).settings.arguments as String; //recive single item from args throgh named routes.
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Center(
        child: Text(
          'Meal Detail Screen id : $mealid',
        ),
      ),
    );
  }
}
