import 'package:verbose_task/category/data/venders/venders_model.dart';

import '../../data/categories/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories ();
}