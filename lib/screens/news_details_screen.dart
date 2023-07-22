import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import '../api/model/Article.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Article;
    DateTime dataTime = DateTime.parse(args.publishedAt ?? '');

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main_back_ground.png'),
            fit: BoxFit.fill,
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Detaies'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 220,
                    imageUrl: args.urlToImage ?? '',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(args.author ?? '',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff79828B)
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(args.title ?? '',
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
                    timeago.format(dataTime),
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xffA3A3A3)
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(args.description ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff42505C),

                  ),
                ),

                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                      onPressed: () {
                        openUrl(args.url ??'');
                      },
                      icon: Text('View Full Article', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff42505C)
                      ),),
                      label: Icon(Icons.arrow_right_outlined)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openUrl(String url) async {
    var uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.inAppWebView);
    }
  }
}
