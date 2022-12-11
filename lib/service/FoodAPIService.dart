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
  static const foodByletterBaseURL =
      "https://www.themealdb.com/api/json/v1/1/search.php?f=";

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

  Future<List<Meals>> getFoodAll() async {
    try {
      String _harf = "a";
      int c = "a".codeUnitAt(0);
      int end = "z".codeUnitAt(0);
      List<Meals> listMe = [];
      while (c <= end) {
        _harf = String.fromCharCode(c);
        Response response = await Dio().get(foodByletterBaseURL + _harf);
        var meal = Meal.fromJson(response.data);

        c++;
        if (meal.meals != null) {
          for (var element in meal.meals!) {
            listMe.add(element);
          }
        }
        c++;
      }
      return listMe;
    } catch (e) {
      rethrow;
    }
  }

  List<String?> getIngreditientsList(Meals meal) {
    List<String?> ingreditientsList = [];
    if (meal.strIngredient1 != "" &&
        meal.strMeasure1 != "" &&
        meal.strMeasure1 != " ") {
      ingreditientsList.add("${meal.strMeasure1} ${meal.strIngredient1}");
    }
    if (meal.strIngredient2 != null &&
        meal.strMeasure2 != "" &&
        meal.strMeasure2 != " ") {
      ingreditientsList.add("${meal.strMeasure2} ${meal.strIngredient2}");
    }
    if (meal.strIngredient3 != null &&
        meal.strMeasure3 != "" &&
        meal.strMeasure3 != " ") {
      ingreditientsList.add("${meal.strMeasure3} ${meal.strIngredient3}");
    }
    if (meal.strIngredient4 != null &&
        meal.strMeasure4 != "" &&
        meal.strMeasure4 != " ") {
      ingreditientsList.add("${meal.strMeasure4} ${meal.strIngredient4}");
    }
    if (meal.strIngredient5 != null &&
        meal.strMeasure5 != "" &&
        meal.strMeasure5 != " " &&
        meal.strIngredient5 != "") {
      ingreditientsList.add("${meal.strMeasure5} ${meal.strIngredient5}");
    }
    if (meal.strIngredient6 != null &&
        meal.strMeasure6 != "" &&
        meal.strMeasure6 != "") {
      ingreditientsList.add("${meal.strMeasure6} ${meal.strIngredient6}");
    }
    if (meal.strIngredient7 != null &&
        meal.strMeasure7 != "" &&
        meal.strMeasure7 != " ") {
      ingreditientsList.add("${meal.strMeasure7} ${meal.strIngredient7}");
    }
    if (meal.strIngredient8 != null &&
        meal.strMeasure8 != "" &&
        meal.strMeasure8 != " ") {
      ingreditientsList.add("${meal.strMeasure8} ${meal.strIngredient8}");
    }
    if (meal.strIngredient9 != null &&
        meal.strMeasure9 != "" &&
        meal.strMeasure9 != " ") {
      ingreditientsList.add("${meal.strMeasure9} ${meal.strIngredient9}");
    }
    if (meal.strIngredient10 != null &&
        meal.strMeasure10 != "" &&
        meal.strMeasure10 != " ") {
      ingreditientsList.add("${meal.strMeasure10} ${meal.strIngredient10}");
    }
    if (meal.strIngredient11 != null &&
        meal.strMeasure11 != "" &&
        meal.strMeasure11 != " ") {
      ingreditientsList.add("${meal.strMeasure11} ${meal.strIngredient11}");
    }
    if (meal.strIngredient12 != null &&
        meal.strMeasure12 != "" &&
        meal.strMeasure12 != " ") {
      ingreditientsList.add("${meal.strMeasure12} ${meal.strIngredient12}");
    }
    if (meal.strIngredient13 != null &&
        meal.strMeasure13 != "" &&
        meal.strMeasure13 != " ") {
      ingreditientsList.add("${meal.strMeasure13} ${meal.strIngredient13}");
    }
    if (meal.strIngredient14 != null &&
        meal.strMeasure14 != "" &&
        meal.strMeasure14 != " ") {
      ingreditientsList.add("${meal.strMeasure14} ${meal.strIngredient14}");
    }
    if (meal.strIngredient15 != null &&
        meal.strMeasure15 != "" &&
        meal.strMeasure15 != " ") {
      ingreditientsList.add("${meal.strMeasure15} ${meal.strIngredient15}");
    }
    if (meal.strIngredient16 != "" &&
        meal.strMeasure16 != "" &&
        meal.strMeasure16 != " " &&
        meal.strMeasure16 != null) {
      ingreditientsList.add("${meal.strMeasure16} ${meal.strIngredient16}");
    }
    if (meal.strIngredient17 != "" &&
        meal.strMeasure17 != "" &&
        meal.strMeasure17 != " " &&
        meal.strMeasure17 != null) {
      ingreditientsList.add("${meal.strMeasure17} ${meal.strIngredient17}");
    }
    if (meal.strIngredient18 != "" &&
        meal.strMeasure18 != "" &&
        meal.strMeasure18 != " " &&
        meal.strMeasure18 != null) {
      ingreditientsList.add("${meal.strMeasure18} ${meal.strIngredient18}");
    }
    if (meal.strIngredient19 != "" &&
        meal.strMeasure19 != "" &&
        meal.strMeasure19 != " " &&
        meal.strMeasure19 != null) {
      ingreditientsList.add("${meal.strMeasure19} ${meal.strIngredient19}");
    }
    if (meal.strIngredient20 != "" &&
        meal.strMeasure20 != "" &&
        meal.strMeasure20 != " " &&
        meal.strMeasure20 != null) {
      ingreditientsList.add("${meal.strMeasure20} ${meal.strIngredient20}");
    }
    return ingreditientsList;
  }
}
