import 'package:flutter/material.dart';
import 'package:news_aoo/model/category_model.dart';
import '../screens/categories_Screen/categories_screen.dart';
import '../screens/news_search.dart';
import 'home_news_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory ;

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main_back_ground.png'),
            fit: BoxFit.fill,
          )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.green,
                height: 200,
                child: const Text('News App',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedCategory = null;
                    Navigator.pop(context);
                  });

                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.list,size: 40,),
                      SizedBox(width: 5,),
                      Text('Categories',
                      style: TextStyle(
                        fontSize: 25
                      ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings,size: 40,),
                    SizedBox(width: 5,),
                    Text('Settings',
                      style: TextStyle(
                          fontSize: 25
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions:
          selectedCategory == null ? null :

          [
            IconButton(
                onPressed: (){
                  showSearch(context: context, delegate: NewsSearch());
                },
                icon: const Icon(Icons.search))
          ],
          title: Text( selectedCategory == null? 'News App' : selectedCategory!.title ),
        ),
        body: selectedCategory == null?
        CategoriesScreen(selectCategory) :
        HomeNewsFragment(selectedCategory!)
      ),
    );
  }

 selectCategory(CategoryModel category){
    setState(() {
      selectedCategory = category;
    });

  }
}

