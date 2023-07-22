import 'package:flutter/material.dart';
import 'package:news_aoo/api/model/Source.dart';

class TabItem extends StatelessWidget {
bool selected;
Source? sourceTitle;
TabItem({required this.selected,required this.sourceTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: Colors.green,
          width: 2,
        )
      ),
      child: Text(sourceTitle?.name ?? '',
      style: TextStyle(
        color: Colors.green
      ).copyWith(
        color: selected? Colors.white:Colors.green
      ),
      ),
    );
  }
}
