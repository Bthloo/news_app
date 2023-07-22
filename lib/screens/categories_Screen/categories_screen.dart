import 'package:flutter/material.dart';

import '../../component/category_item.dart';
import '../../model/category_model.dart';

class CategoriesScreen extends StatelessWidget {
Function callBack;
static const String routeName= 'cat';
CategoriesScreen(this.callBack);
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(id : 'general',title: 'General', imagePath: 'assets/ball.png', background: Color(0xffc600ff)),
      CategoryModel(id : 'sports',title: 'Sports', imagePath: 'assets/ball.png', background: Color(0xffC91C22)),
      CategoryModel(id : 'health',title: 'Health', imagePath: 'assets/health.png', background: Color(0xffED1E79)),
      CategoryModel(id : 'business',title: 'Business ', imagePath: 'assets/bussines.png', background: Color(0xffCF7E48)),
      CategoryModel(id : 'technology',title: 'Entertainment', imagePath: 'assets/environment.png', background: Color(0xff4882CF)),
      CategoryModel(id : 'science',title: 'Science', imagePath: 'assets/science.png', background: Color(0xffF2D352)),
    ];
    return Padding(
      padding:  EdgeInsets.only( top: 15.0,  right: 15,left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''Pick your category
of interest''',
            style: TextStyle(
                color: Color(0xff4F5A69),
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    callBack(categories[index]);
                  },
                    child: CategoryItem(
                        categories[index], index
                    )
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
