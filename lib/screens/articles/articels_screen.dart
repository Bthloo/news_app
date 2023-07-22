import 'package:flutter/material.dart';
import 'package:news_aoo/api/api_manager.dart';
import 'package:news_aoo/component/tab_item.dart';

import '../../api/model/Source.dart';
import '../../component/article_item.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources;
  ArticlesScreen(this.sources);
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            indicatorSize: null,
            isScrollable: true,
            onTap: (index){
              setState(() {
                selectedIndex = index;
              });

            },
              tabs: widget.sources?.map((source) =>
                  TabItem(selected: selectedIndex==widget.sources?.indexOf(source),
                      sourceTitle: source)).toList() ?? []
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                child: FutureBuilder(
                    future: ApiManager.getNewsData(sourceId: widget.sources?[selectedIndex].id ?? ''),
                    builder: (context , snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator());
                      }
                      if(snapshot.hasError){
                        return Center(
                          child: Column(
                            children: [
                              Text(snapshot.error.toString()),
                              ElevatedButton(
                                  onPressed: (){},
                                  child: const Text('Try Again'))
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
                                  child: const Text('Try Again'))
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

        ],
      ),
    );
  }
}
