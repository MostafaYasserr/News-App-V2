import 'package:flutter/material.dart';
import '../models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({
    super.key,
    required this.onCategorySelected,
  });

  final Function(String category) onCategorySelected;
  final List<CategoryModel> categoryModelList = [
    CategoryModel(
      imageAssetsUrl: 'assets/general.avif',
      category: 'general',
    ),
    CategoryModel(
      imageAssetsUrl: 'assets/business.avif',
      category: 'business',
    ),
    CategoryModel(
      imageAssetsUrl: 'assets/entertaiment.avif',
      category: 'entertainment',
    ),
    CategoryModel(
      imageAssetsUrl: 'assets/health.avif',
      category: 'health',
    ),
    CategoryModel(
      imageAssetsUrl: 'assets/science.avif',
      category: 'science',
    ),
    CategoryModel(
      imageAssetsUrl: 'assets/sports.avif',
      category: 'sports',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryModelList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 12,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            categoryModel: categoryModelList[index],
            onCategorySelected: onCategorySelected,
          );
        },
      ),
    );
  }
}
