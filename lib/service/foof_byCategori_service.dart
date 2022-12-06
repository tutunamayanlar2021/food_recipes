import 'package:dio/dio.dart';

import '../model/food_by_categori_api/food_by_categori_model.dart';

class FoodByCategoriApiServices {
  final String _url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=";

  late Dio dio;

  FoodByCategoriApiServices() {
    dio = Dio();
  }
  Future<List<Meal>?> fetchNewsArticle(List<String> foodName, int index) async {
    try {
      try {
        List<FoodbyCategoriResponse> responseList2 = [];

        while (index < foodName.length) {
          Response response = await dio.get(_url + foodName[index].toString());
          FoodbyCategoriResponse newsResponce =
              FoodbyCategoriResponse.fromJson(response.data);
          responseList2.add(newsResponce);
          print(foodName[index].toString());

          for (var element in responseList2) {
            return element.meals;
          }
          index++;
        }

        //return responseList;
      } on DioError catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
