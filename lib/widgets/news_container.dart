import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../screens/news_web_view.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.newsModel,});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return NewsWebView(url:newsModel.newsUrl??'page Not Found');
        },));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: newsModel.newsImage ?? '',
                placeholder: (context, url) {
                  return const CircularProgressIndicator();
                },
                errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.error,
                    color: Colors.black,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              newsModel.newsTitle ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsModel.newsText ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
