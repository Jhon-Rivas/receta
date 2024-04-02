import 'dart:convert';

import 'package:dio/dio.dart';

class GetPetition {
  final _dio = Dio();

  Future getProducto() async {
    final response = await _dio
        .get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka');

    return response.data;
  }

  Future getIngredientes(String idDrink) async {
    final response = await _dio.get(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$idDrink');

    return response.data;
  }
}
