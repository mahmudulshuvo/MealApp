import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'Category'),
      ),
      body: ListView.builder(
          itemBuilder: (builder, idx) {
            return MealItem(
                id: categoryMeals[idx].id,
                title: categoryMeals[idx].title,
                imageUrl: categoryMeals[idx].imageUrl,
                duration: categoryMeals[idx].duration,
                complexity: categoryMeals[idx].complexity,
                affordability: categoryMeals[idx].affordability);
          },
          itemCount: categoryMeals.length),
    );
  }
}
