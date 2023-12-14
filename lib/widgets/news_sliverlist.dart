import 'package:flutter/material.dart';
import '../models/news_model.dart';
import 'news_container.dart';


class NewsSliverList extends StatelessWidget {
  const NewsSliverList({super.key,required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: newsList.length,
                  (context, index) {
                return NewsContainer(newsModel: newsList[index]);
              }));
  }
}

