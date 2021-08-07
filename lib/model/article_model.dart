class Article {
  final String title;
  final String description;
  final String url;
  final String source;
  final String? image;
  final String category;
  final String language;
  final String country;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    this.image,
    required this.category,
    required this.language,
    required this.country,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        source: json['source'] as String,
        image: json['image'],
        category: json['category'] as String,
        language: json['language'] as String,
        country: json['country'] as String,
        publishedAt: json['published_at'] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['source'] = this.source;
    data['image'] = this.image;
    data['category'] = this.category;
    data['language'] = this.language;
    data['country'] = this.country;
    data['published_at'] = this.publishedAt;
    return data;
  }
}
