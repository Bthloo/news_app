import 'package:flutter/material.dart';
import 'package:news_aoo/api/api_manager.dart';
import 'package:news_aoo/screens/articles/articels_screen.dart';

import '../model/category_model.dart';

class HomeNewsFragment extends StatelessWidget {
  CategoryModel categoryModel;
HomeNewsFragment(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsSources(categoryModel.id ?? ''),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Try Again'))
              ],
            ),
          );
        }
         if(snapshot.data?.status == 'error'){
           return Center(
             child: Column(
               children: [
                 Text(snapshot.data?.message ?? ''),
                 ElevatedButton(
                     onPressed: (){},
                     child: Text('Try Again'))
               ],
             ),
           );
         }

         return ArticlesScreen(snapshot.data?.sources );
      }

    );
  }
}
