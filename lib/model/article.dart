class Article {
  Article({
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String author;
  String title;
  String urlToImage;
  String publishedAt;
  String content;
  static String noImageURL =
      "https://dpwfkdtjabar.com/assets/images/artikel/no-image.png";

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
      // ignore: unnecessary_null_in_if_null_operators
      author: json['author'] ?? 'Anonymous',
      title: json['title'] ?? 'null',
      urlToImage: json['urlToImage'] ?? Article.noImageURL,
      publishedAt: json['publishedAt'] ?? 'null',
      content: json['content'] ?? 'null',
    );
  }
}
