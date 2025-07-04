
import 'package:bloc/bloc.dart';
import '../../../domain/category/category_useCase.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>{
  final CategoryUseCase _useCase;
  CategoryCubit(this._useCase) : super(const CategoryInitial());

  Future<void> getCategories () async{
    emit(CategoryLoading());
    try{
      final list = await _useCase.categories();
      emit(CategoryLoaded(list));
    }catch (e){
      emit(CategoryError(e.toString()));
    }
  }
}