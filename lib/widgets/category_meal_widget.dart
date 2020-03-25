import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class CategoryMealWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String mealId;
  final Function removeItem;

  CategoryMealWidget(
      {@required this.mealId,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.removeItem});

  void selectedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: mealId)
        .then((result) {
      if (result != null) {
        print(result);
        removeItem(result);
      }
    });
  }

  String get enumComplexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
    if (complexity == Complexity.Expert) {
      return 'Expert';
    }
  }

  String get enumAffordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    if (affordability == Affordability.Costly) {
      return 'Costly';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  //                  width: 300,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AdaptiveRowWidget(
                    title: '$duration mins',
                    icon: Icons.schedule,
                  ),
                  AdaptiveRowWidget(
                    title: enumComplexityText,
                    icon: Icons.work,
                  ),
                  AdaptiveRowWidget(
                    title: enumAffordabilityText,
                    icon: Icons.attach_money,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdaptiveRowWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  AdaptiveRowWidget({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
          softWrap: true,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
