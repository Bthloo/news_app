import 'package:flutter/material.dart';
import 'package:news_aoo/api/model/Article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../screens/news_details_screen.dart';

class ArticleItem extends StatelessWidget {
Article article;
ArticleItem(this.article);
  @override
  Widget build(BuildContext context) {
    DateTime dataTime = DateTime.parse(article.publishedAt ?? '');
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: article);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.fill,
              height: 220,
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 220,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     image: DecorationImage(
          //         image: NetworkImage(article.urlToImage ?? ''),
          //       fit: BoxFit.fill
          //     )
          //   ),
          // ),
          SizedBox(height: 5,),
          Text(article.author ?? '',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xff79828B)
          ),
          ),
          SizedBox(height: 5,),
          Text(article.title ?? '',
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff42505C),
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              //article.publishedAt ?? '',
              timeago.format( dataTime),
              style: TextStyle(
                  fontSize: 13,
                  color: Color(0xffA3A3A3)
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
