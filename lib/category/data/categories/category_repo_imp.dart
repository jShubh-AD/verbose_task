import 'package:verbose_task/category/data/categories/category_datasource.dart';
import 'package:verbose_task/category/data/venders/venders_model.dart';
import 'package:verbose_task/category/domain/category/category_repo.dart';

import '../venders/venders_datasource.dart';
import 'category_model.dart';

class CategoryImp extends CategoryRepository {
  @override
  Future<List<CategoryModel>> getCategories() async{
    return await CategoryDatasource().getCategories();
  }
}