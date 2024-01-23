import 'package:clean_arch_app/Data/Model/category.dart';

abstract class NetworkRepository {
  Future<CategoryApiResModel> fetchCategory(String path);
}
