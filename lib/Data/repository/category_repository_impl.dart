import 'package:clean_arch_app/Data/mapper/category_mapper.dart';
import 'package:clean_arch_app/Domain/Repository/category_repository.dart';
import 'package:clean_arch_app/Domain/entity/category_entity.dart';
import 'package:clean_arch_app/core/network/network_repository.dart';
import '../Model/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final NetworkRepository networkRepository;
  CategoryRepositoryImpl(this.networkRepository);

  @override
  Future<List<CategoryEntity>> getMealCategory() async {
    try {
      CategoryApiResModel categoryApiResModel =
          await networkRepository.fetchCategory("categories.php");
      List<CategoryModel> categoryModel = categoryApiResModel.categories ?? [];
      return categoryModel
          .map(
            (cat) => CategoryMapper().convert(cat),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
