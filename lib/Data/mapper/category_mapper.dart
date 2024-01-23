import 'package:clean_arch_app/Data/Model/category.dart';
import 'package:clean_arch_app/Domain/entity/category_entity.dart';

class CategoryMapper {
  CategoryEntity convert(CategoryModel category) {
    return CategoryEntity(
      strCategoryThumb: category.strCategoryThumb,
      strCategory: category.strCategory,
    );
  }
}
