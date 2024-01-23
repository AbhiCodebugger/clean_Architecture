part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryEntity>? categories;

  CategorySuccess({required this.categories});
}

final class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure(this.error);
}

final class CategoryLoading extends CategoryState {}
