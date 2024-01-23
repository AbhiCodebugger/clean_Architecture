import 'package:clean_arch_app/Domain/entity/category_entity.dart';
import 'package:clean_arch_app/Presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meals Category"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CategoryBloc>().add(FetchedCategoryEvent());
          },
          child: const Icon(Icons.replay_outlined),
        ),
        body: BlocConsumer<CategoryBloc, CategoryState>(
            builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CategorySuccess) {
            return GridView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: state.categories!.length,
                itemBuilder: (context, index) {
                  CategoryEntity category = state.categories![index];
                  return Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child:
                              Image.network(category.strCategoryThumb ?? "")),
                      Text(category.strCategory ?? ""),
                    ],
                  );
                });
          } else {
            return Container();
          }
        }, listener: (context, state) {
          if (state is CategoryFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
          if (state is CategorySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Category Fetched"),
              ),
            );
          }
        }));
  }
}
