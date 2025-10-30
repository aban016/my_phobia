import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  static const String _apiKey = 'c50cd67a2c34483fb1623ffb410cab17';
  static const String _baseUrl = 'https://newsapi.org/v2';

  static Future<List<NewsArticle>> fetchHealthNews() async {
    try {
      final url = Uri.parse(
        '$_baseUrl/top-headlines?country=us&category=health&apiKey=$_apiKey'
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        
        return articles
            .map((article) => NewsArticle.fromJson(article))
            .where((article) => 
                article.title.isNotEmpty && 
                article.description.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }

  static Future<List<NewsArticle>> searchHealthNews(String query) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/everything?q=$query&language=en&sortBy=publishedAt&apiKey=$_apiKey'
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        
        return articles
            .map((article) => NewsArticle.fromJson(article))
            .where((article) => 
                article.title.isNotEmpty && 
                article.description.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to search news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching news: $e');
    }
  }
}
