class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String source;
  final String content;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      source: json['source']?['name'] ?? '',
      content: json['content'] ?? '',
    );
  }

  String get formattedDate {
    if (publishedAt.isEmpty) return '';
    
    try {
      final date = DateTime.parse(publishedAt);
      return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
    } catch (e) {
      return publishedAt;
    }
  }

  String get readTime {
    // Estimate reading time based on content length
    final wordCount = content.split(' ').length;
    final minutes = (wordCount / 200).ceil(); // Average reading speed: 200 words per minute
    return '$minutes mins read';
  }

  String get readCount {
    // Generate a random read count for display purposes
    final random = DateTime.now().millisecondsSinceEpoch % 10000;
    final reads = (random / 1000).toStringAsFixed(2);
    return '$reads k reads';
  }
}
