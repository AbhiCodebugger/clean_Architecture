import 'package:clean_arch_app/Data/Exception/api_exception.dart';
import 'package:clean_arch_app/Domain/Usecase/categories_use_case.dart';
import 'package:clean_arch_app/Domain/entity/category_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUseCase categoryUseCase;
  CategoryBloc(this.categoryUseCase) : super(CategoryInitial()) {
    on<FetchedCategoryEvent>(_onFetchCategory);
  }

  _onFetchCategory(FetchedCategoryEvent event, Emitter emit) async {
    emit(CategoryLoading());
    try {
      final categories = await categoryUseCase.fetchCategory();
      emit(CategorySuccess(categories: categories));
    } catch (e) {
      if (e is ApiException) {
        emit(CategoryFailure("Error: ${e.statusCode} ${e.responseData}"));
      } else {
        emit(CategoryFailure("An unexpected error occurred"));
      }
    }
  }
}
