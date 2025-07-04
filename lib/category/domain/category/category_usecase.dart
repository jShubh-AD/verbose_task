import 'package:verbose_task/category/data/categories/category_repo_imp.dart';
import 'package:verbose_task/category/domain/category/category_repo.dart';

import '../../data/categories/category_model.dart';

class CategoryUseCase {

  final CategoryRepository repo = CategoryImp();

  Future<List<CategoryModel>> categories () async{
    List<CategoryModel> category = await repo.getCategories();
    return category;
  }


}
