import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_categories.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail-screen';

  Widget headerWidget(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Steps',
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(
      MediaQueryData mediaQuery, AppBar appBar, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.3,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments
        as String; //recive single item from args throgh named routes.
    final mediaQuery = MediaQuery.of(context);
    final selectedMealData = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealid;
    });

    final appBar = AppBar(
      title: Text(selectedMealData.title),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.4,
              width: double.infinity,
              child: Image.network(
                selectedMealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            headerWidget(context, 'Ingredients'),
            buildContainer(
              mediaQuery,
              appBar,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.white,
                    child: Text(
                      selectedMealData.ingredients[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title.copyWith(
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 1.0,
                          ),
                    ),
                  );
                },
                itemCount: selectedMealData.ingredients.length,
              ),
            ),
            headerWidget(context, 'Steps'),
            buildContainer(
              mediaQuery,
              appBar,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  '#${index + 1}',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  selectedMealData.steps[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: selectedMealData.steps.length,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealid);
        },
        elevation: 4,
        splashColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
