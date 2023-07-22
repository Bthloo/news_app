import 'dart:ui';

class CategoryModel{
  String title;
  String id;
  String imagePath;
  Color background;

  CategoryModel({required this.title,
    required this.imagePath,
    required this.background,
    required this.id
  });
}