import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:verbose_task/core/http/api_constants.dart';

import 'category_model.dart';

class CategoryDatasource {

  Future<List<CategoryModel>> getCategories() async{
    String url = EndPoints.category.baseUrl();
    var response =  await http.get(Uri.parse(url));
    print('$url urlURL');

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      final List<CategoryModel> categories = data.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>)).toList();
      return categories;
    }else {
      throw Exception('Data could not be fetched');
    }
  }
}