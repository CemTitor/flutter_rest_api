import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:null_rest_api/models/api_response.dart';
import 'package:null_rest_api/models/food_for_listing.dart';

class FoodService {
  static const API = 'https://localhost:5001/swagger/api/Products';
  // static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<FoodForListing>>> getFoodList() {
    return http
        .get(
      Uri.parse(API + '/getall'),
    )
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final foods = <FoodForListing>[];
        for (var item in jsonData) {
          final note = FoodForListing(
            productId: item['productId'],
            categoryId: item['categoryId'],
            productName: item['productName'],
            unitsInStock: item['unitsInStock'],
            unitPrice: item['unitPrice'],
          );
          foods.add(note);
        }
        return APIResponse<List<FoodForListing>>(data: foods);
      }
      return APIResponse<List<FoodForListing>>(
          error: true, errorMessage: "${data.statusCode}}");
    }).catchError((_) => APIResponse<List<FoodForListing>>(
            error: true, errorMessage: 'An error occured'));
  }
}
