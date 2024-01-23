import 'package:clean_arch_app/Data/repository/category_repository_impl.dart';
import 'package:clean_arch_app/Domain/Repository/category_repository.dart';
import 'package:clean_arch_app/Domain/Usecase/categories_use_case.dart';
import 'package:clean_arch_app/Presentation/bloc/category_bloc.dart';
import 'package:clean_arch_app/Presentation/category_screen.dart';
import 'package:clean_arch_app/core/network/network_repository.dart';
import 'package:clean_arch_app/core/network/network_repository_impl.dart';
import 'package:clean_arch_app/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio _dio = Dio();
    return BlocProvider(
      create: (context) => CategoryBloc(
        CategoryUseCase(
          CategoryRepositoryImpl(
            NetworkRepositoryImp(_dio, base_url),
          ),
        ),
      ),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const CategoryScreen()),
    );
  }
}
