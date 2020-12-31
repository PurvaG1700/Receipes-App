import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var item = widget.favouriteMeals[index];
          return MealItem(
            affordability: item.affordability,
            complexity: item.complexity,
            duration: item.duration,
            imageUrl: item.imageUrl,
            title: item.title,
            id: item.id,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
