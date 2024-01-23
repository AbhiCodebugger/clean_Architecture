import 'package:clean_arch_app/Data/Exception/api_exception.dart';
import 'package:clean_arch_app/Data/Model/category.dart';
import 'package:clean_arch_app/core/network/network_repository.dart';
import 'package:dio/dio.dart';

class NetworkRepositoryImp implements NetworkRepository {
  final Dio _dio;
  final String _base_url;
  NetworkRepositoryImp(this._dio, this._base_url);

  @override
  Future<CategoryApiResModel> fetchCategory(String path) async {
    try {
      Response response = await _dio.get("$_base_url/$path");
      if (response.statusCode == 200) {
        return CategoryApiResModel.fromJson(response.data);
      } else {
        throw ApiException(response.statusCode, response.statusMessage);
      }
    } catch (e) {
      throw ApiException(500, "Internal Server Error");
    }
  }
}
