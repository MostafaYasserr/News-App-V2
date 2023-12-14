import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_services.dart';
import 'news_sliverlist.dart';

class NewsSliverListBuilder extends StatefulWidget {
  const NewsSliverListBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsSliverListBuilder> createState() => _NewsSliverListBuilderState();
}

class _NewsSliverListBuilderState extends State<NewsSliverListBuilder> {
  late Future<List<NewsModel>> future;

  @override
  void didUpdateWidget(covariant NewsSliverListBuilder oldWidget) {
    if (oldWidget.category != widget.category) {
      future = NewsService().getNews(category: widget.category);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    future = NewsService().getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsSliverList(
              newsList: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'oops there was an error ,try again later',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
