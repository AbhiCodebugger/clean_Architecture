import 'package:clean_arch_app/Data/Model/category.dart';
import 'package:clean_arch_app/core/network/network_repository.dart';

class RemoteDataSource {
  final NetworkRepository _networkRepository;
  RemoteDataSource(this._networkRepository);

  Future<CategoryApiResModel> fetchCategory(String path) async {
    return _networkRepository.fetchCategory(path);
  }
}
