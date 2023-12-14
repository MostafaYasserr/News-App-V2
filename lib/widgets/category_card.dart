import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
    required this.onCategorySelected,
  });

  final CategoryModel categoryModel;
  final Function(String category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCategorySelected(categoryModel.category);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
              child: Image.asset(
                categoryModel.imageAssetsUrl,
                width: 210,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            categoryModel.category,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
