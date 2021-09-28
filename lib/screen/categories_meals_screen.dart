import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  List<Meal>availableMeals;
  CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
   //...
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
     final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = widget.availableMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    _loadedInitData=true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
     setState(() {
       displayedMeals.removeWhere((meal) => meal.id == mealId);
     });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              //removeItem: _removeMeal,
              );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
