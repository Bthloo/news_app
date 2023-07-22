import 'package:flutter/material.dart';
import 'package:news_aoo/model/category_model.dart';

class CategoryItem extends StatelessWidget {
CategoryModel category;
int index;
CategoryItem(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.background,
        borderRadius: BorderRadius.only(
          topLeft:   Radius.circular(30),
          topRight:   Radius.circular(30),
          bottomLeft: index.isEven ?   Radius.circular(30) : Radius.zero,
          bottomRight: index.isOdd ?   Radius.circular(30) : Radius.zero,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(category.imagePath),
             Text(category.title,
            style:   TextStyle(
              color: Colors.white,
              fontSize: 22
            ),
            ),
          ],
        ),
      ),
    );
  }
}
