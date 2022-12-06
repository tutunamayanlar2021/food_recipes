import 'package:dio/dio.dart';

import '../model/food_by_name_api.dart/food_byName_api_model.dart';

class FoodByNameApiServices {
  String _harf = "a";
  final String _url = "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  late Dio dio;

  FoodByNameApiServices() {
    dio = Dio();
  }
  Future<List<MealsByName>?> fetchNewsArticle(String foodName) async {
    try {
      List<FoodbyNameResponse> responseList1 = [];
      int index = 0;

      Response response = await dio.get(_url + foodName.toString());
      FoodbyNameResponse newsResponce =
          FoodbyNameResponse.fromJson(response.data);
      responseList1.add(newsResponce);
      print("food by name: $foodName");
      /*while (index <= 14) {
        for (var element in responseList1) {
          return element.meals;
        }
        index++;
      }*/
      return newsResponce.meals!;

      // return responseList1;
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
