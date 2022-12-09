import 'package:dio/dio.dart';
import 'package:food_recipes/models/Category.dart';
import 'package:food_recipes/models/Meal.dart';

class FoodAPIService {
  static final FoodAPIService _singleton = FoodAPIService._internal();

  static const categoryListBaseURL =
      "https://www.themealdb.com/api/json/v1/1/categories.php";

  static const filterFoodListByCategoryBaseURL =
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=";

  static const foodDetailsBaseURL =
      "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";

  factory FoodAPIService() {
    return _singleton;
  }

  FoodAPIService._internal();

  Future<Category?> getFoodCategories() async {
    try {
      Response response = await Dio().get(categoryListBaseURL);
      if (response.statusCode == 200) {
        var categoryList = Category.fromJson(response.data);
        return categoryList;
      } else {
        return Future.value();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Meal?> filterFoodListByCategoryName(String? categoryName) async {
    try {
      Response response = await Dio()
          .get(filterFoodListByCategoryBaseURL + categoryName.toString());
      if (response.statusCode == 200) {
        return Meal.fromJson(response.data);
      } else {
        return Future.value();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Meal?> getFoodDetails(String? foodID) async {
    try {
      Response response =
          await Dio().get(foodDetailsBaseURL + foodID.toString());
      if (response.statusCode == 200) {
        return Meal.fromJson(response.data);
      } else {
        return Future.value();
      }
    } catch (e) {
      rethrow;
    }
  }

  List<String?> getIngreditientsList(Meals meal) {
    List<String?> ingreditientsList = [];
    if (meal.strIngredient1 != "") {
      ingreditientsList.add("${meal.strMeasure1} ${meal.strIngredient1}");
    }
    if (meal.strIngredient2 != null) {
      ingreditientsList.add("${meal.strMeasure2} ${meal.strIngredient2}");
    }
    if (meal.strIngredient3 != null) {
      ingreditientsList.add("${meal.strMeasure3} ${meal.strIngredient3}");
    }
    if (meal.strIngredient4 != null) {
      ingreditientsList.add("${meal.strMeasure4} ${meal.strIngredient4}");
    }
    if (meal.strIngredient5 != null) {
      ingreditientsList.add("${meal.strMeasure5} ${meal.strIngredient5}");
    }
    if (meal.strIngredient6 != null) {
      ingreditientsList.add("${meal.strMeasure6} ${meal.strIngredient6}");
    }
    if (meal.strIngredient7 != null) {
      ingreditientsList.add("${meal.strMeasure7} ${meal.strIngredient7}");
    }
    if (meal.strIngredient8 != null) {
      ingreditientsList.add("${meal.strMeasure8} ${meal.strIngredient8}");
    }
    if (meal.strIngredient9 != null) {
      ingreditientsList.add("${meal.strMeasure9} ${meal.strIngredient9}");
    }
    if (meal.strIngredient10 != null) {
      ingreditientsList.add("${meal.strMeasure10} ${meal.strIngredient10}");
    }
    if (meal.strIngredient11 != null) {
      ingreditientsList.add("${meal.strMeasure11} ${meal.strIngredient11}");
    }
    if (meal.strIngredient12 != null) {
      ingreditientsList.add("${meal.strMeasure12} ${meal.strIngredient12}");
    }
    if (meal.strIngredient13 != null) {
      ingreditientsList.add("${meal.strMeasure13} ${meal.strIngredient13}");
    }
    if (meal.strIngredient14 != null) {
      ingreditientsList.add("${meal.strMeasure14} ${meal.strIngredient14}");
    }
    if (meal.strIngredient15 != null) {
      ingreditientsList.add("${meal.strMeasure15} ${meal.strIngredient15}");
    }
    if (meal.strIngredient16 != null) {
      ingreditientsList.add("${meal.strMeasure16} ${meal.strIngredient16}");
    }
    if (meal.strIngredient17 != null) {
      ingreditientsList.add("${meal.strMeasure17} ${meal.strIngredient17}");
    }
    if (meal.strIngredient18 != null) {
      ingreditientsList.add("${meal.strMeasure18} ${meal.strIngredient18}");
    }
    if (meal.strIngredient19 != null) {
      ingreditientsList.add("${meal.strMeasure19} ${meal.strIngredient19}");
    }
    if (meal.strIngredient20 != null) {
      ingreditientsList.add("${meal.strMeasure20} ${meal.strIngredient20}");
    }
    return ingreditientsList;
  }

  List<String?> getMeasureListCalc(Meals meal) {
    List<String?> measureList = [];

    if (meal.strMeasure1 != "") {
      measureList.add(meal.strMeasure1);
    }
    if (meal.strMeasure2 != "") {
      measureList.add(meal.strMeasure2);
    }
    if (meal.strMeasure3 != "") {
      measureList.add(meal.strMeasure3);
    }
    if (meal.strMeasure4 != "") {
      measureList.add(meal.strMeasure4);
    }
    if (meal.strMeasure5 != "") {
      measureList.add(meal.strMeasure5);
    }
    if (meal.strMeasure6 != "") {
      measureList.add(meal.strMeasure6);
    }
    if (meal.strMeasure7 != "") {
      measureList.add(meal.strMeasure7);
    }
    if (meal.strMeasure8 != "") {
      measureList.add(meal.strMeasure8);
    }
    if (meal.strMeasure9 != "") {
      measureList.add(meal.strMeasure9);
    }
    if (meal.strMeasure10 != "") {
      measureList.add(meal.strMeasure10);
    }
    if (meal.strMeasure11 != "") {
      measureList.add(meal.strMeasure11);
    }
    if (meal.strMeasure12 != "") {
      measureList.add(meal.strMeasure12);
    }
    if (meal.strMeasure13 != "") {
      measureList.add(meal.strMeasure13);
    }
    if (meal.strMeasure14 != "") {
      measureList.add(meal.strMeasure14);
    }
    if (meal.strMeasure15 != "") {
      measureList.add(meal.strMeasure15);
    }
    if (meal.strMeasure16 != "") {
      measureList.add(meal.strMeasure16);
    }
    if (meal.strMeasure17 != "") {
      measureList.add(meal.strMeasure17);
    }
    if (meal.strMeasure18 != "") {
      measureList.add(meal.strMeasure18);
    }
    if (meal.strMeasure19 != "") {
      measureList.add(meal.strMeasure19);
    }
    if (meal.strMeasure20 != "") {
      measureList.add(meal.strMeasure20);
    }
    return measureList;
  }
}
