import 'package:clean_arch_app/Domain/entity/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getMealCategory();
}
