import 'package:dio/dio.dart';
import 'package:food_recipes/model/food_api/food_api_model.dart';

class FoodApiServices {
  String _harf = "a";
  final String _url = "https://www.themealdb.com/api/json/v1/1/search.php?f=";

  late Dio dio;

  FoodApiServices() {
    dio = Dio();
  }
  Future<List<Meals>?> fetchNewsArticle() async {
    try {
      int c = "a".codeUnitAt(0);
      int end = "z".codeUnitAt(0);

      List<Meals> responseList2 = [];
      while (c <= end) {
        _harf = String.fromCharCode(c);
        Response response = await dio.get(_url + _harf);
        FoodResponse newsResponce = FoodResponse.fromJson(response.data);
        //responseList.add(newsResponce);
        if (newsResponce.meals != null) {
          for (var meal in newsResponce.meals!) {
            responseList2.add(meal);
          }
        }

        c++;
      }

      return responseList2;
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
