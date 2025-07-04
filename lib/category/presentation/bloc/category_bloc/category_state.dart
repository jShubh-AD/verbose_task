// category_state.dart
import 'package:equatable/equatable.dart';

import '../../../data/categories/category_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

/// Idle – nothing has happened yet.
class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

/// When we’re talking to the server.
class CategoryLoading extends CategoryState {}

/// Success – UI gets the data it needs.
class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  const CategoryLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

/// Failure – show an error message / retry button, etc.
class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
