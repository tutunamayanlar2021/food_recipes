import 'package:dio/dio.dart';
import '../model/food_categori_api/food_categori_model.dart';

class FoodCategoriApiServices {
  final String _url = "https://www.themealdb.com/api/json/v1/1/categories.php";

  late Dio dio;

  FoodCategoriApiServices() {
    dio = Dio();
  }
  Future<List<Categories>?> fetchNewsArticle() async {
    try {
      List<Categories> responseList2 = [];

      Response response = await dio.get(_url);
      FoodCategoriResponse newsResponce =
          FoodCategoriResponse.fromJson(response.data);
      //responseList.add(newsResponce);
      if (newsResponce.categories != null) {
        for (var meal in newsResponce.categories!) {
          responseList2.add(meal);
        }
      }

      return responseList2;
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
