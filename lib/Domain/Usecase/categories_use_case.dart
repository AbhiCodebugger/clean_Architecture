import 'package:clean_arch_app/Domain/Repository/category_repository.dart';
import 'package:clean_arch_app/Domain/entity/category_entity.dart';

class CategoryUseCase {
  final CategoryRepository repository;
  CategoryUseCase(this.repository);

  Future<List<CategoryEntity>> fetchCategory() async {
    return await repository.getMealCategory();
  }
}
