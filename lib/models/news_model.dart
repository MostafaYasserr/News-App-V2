class NewsModel {
  NewsModel({
    required this.newsImage,
    required this.newsTitle,
    required this.newsText,
    required this.newsUrl,
  });

  final String? newsImage;
  final String? newsTitle;
  final String? newsText;
  final String? newsUrl;

  factory NewsModel.jsonData(json) {
    return NewsModel(
      newsImage: json["urlToImage"],
      newsTitle: json["title"],
      newsText: json["description"],
      newsUrl: json["url"],
    );
  }
}
