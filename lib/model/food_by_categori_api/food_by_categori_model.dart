import 'dart:convert';

FoodbyCategoriResponse welcomeFromJson(String str) =>
    FoodbyCategoriResponse.fromJson(json.decode(str));

String welcomeToJson(FoodbyCategoriResponse data) => json.encode(data.toJson());

class FoodbyCategoriResponse {
  FoodbyCategoriResponse({
    required this.meals,
  });

  List<Meal> meals;

  factory FoodbyCategoriResponse.fromJson(Map<String, dynamic> json) =>
      FoodbyCategoriResponse(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
