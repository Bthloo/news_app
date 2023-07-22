import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../component/article_item.dart';

class NewsSearch extends SearchDelegate {
  NewsSearch({
    String hintText = "Search",
  }) : super(
    searchFieldLabel: hintText,searchFieldStyle: TextStyle(
    color: Colors.green,
  ),
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(50)),
        hintStyle: TextStyle(
          color: Colors.green
        )
      ),

        appBarTheme:const AppBarTheme(
            iconTheme: IconThemeData(
                color: Colors.white,
                size: 35
            ),

            color: Colors.green,
            centerTitle: true,
            toolbarHeight: 80,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
            )
        ),hintColor: Colors.green,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);
        },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
     return IconButton(
         onPressed: (){
           Navigator.pop(context);
         }, icon: Icon(Icons.clear)
     );
  }

  @override
  Widget buildResults(BuildContext context) {
   return  Container(
     child: Expanded(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 12.0),
           child: ClipRRect(
             child: FutureBuilder(
                 future: ApiManager.getNewsData(searchKeyword: query),
                 builder: (context , snapshot){
                   if(snapshot.connectionState == ConnectionState.waiting){
                     return Center(child: CircularProgressIndicator());
                   }
                   if(snapshot.hasError){
                     return Center(
                       child: Container(
                         color: Colors.white,
                         child: Column(
                           children: [
                             Text(snapshot.error.toString()),
                             ElevatedButton(
                                 onPressed: (){
                                   showResults(context);
                                 },
                                 child: Text('Try Again'))
                           ],
                         ),
                       ),
                     );
                   }
                   if(snapshot.data?.status == 'error'){
                     return Center(
                       child: Column(
                         children: [
                           Text(snapshot.data?.message ?? ''),
                           ElevatedButton(
                               onPressed: (){
                                 showResults(context);
                               },
                               child: Text('Try Again'))
                         ],
                       ),
                     );

                   }
                   var newsData = snapshot.data?.articles;
                   return Expanded(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 0.0),
                       child: ListView.builder(
                         itemBuilder: (context,index){
                           return ArticleItem(newsData![index]);
                         },
                         itemCount: newsData?.length,

                       ),
                     ),
                   );
                 }

             ),
           ),
         ),
       ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   //return Text('');
    if(query.isEmpty){
      return Center(child: Text('Please Enter Search Word'));
    }else {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ClipRRect(
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),top:  Radius.circular(20)),
            child: FutureBuilder(
                future: ApiManager.getNewsData(searchKeyword: query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Text(snapshot.error.toString()),
                          ElevatedButton(
                              onPressed: () {
                                showResults(context);
                              },
                              child: Text('Try Again'))
                        ],
                      ),
                    );
                  }
                  if (snapshot.data?.status == 'error') {
                    return Center(
                      child: Column(
                        children: [
                          Text(snapshot.data?.message ?? ''),
                          ElevatedButton(
                              onPressed: () {
                                showResults(context);
                              },
                              child: Text('Try Again'))
                        ],
                      ),
                    );
                  }
                  var newsData = snapshot.data?.articles;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ArticleItem(newsData![index]);
                        },
                        itemCount: newsData?.length,

                      ),
                    ),
                  );
                }

            ),
          ),
        ),
      );
    }
  }


}
