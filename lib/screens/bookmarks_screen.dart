import 'package:flutter/material.dart';
import '../models/article.dart';
import '../widgets/article_card.dart';

class BookmarksScreen extends StatelessWidget {
  final List<Article> bookmarkedArticles;
  final Function(Article) onArticleClick;
  final Function(String) onBookmarkToggle;

  const BookmarksScreen({
    super.key,
    required this.bookmarkedArticles,
    required this.onArticleClick,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (bookmarkedArticles.isEmpty) {
      return const Center(child: Text('No bookmarks yet'));
    }
    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: bookmarkedArticles.map((a) {
        return ArticleCard(
          article: a,
          onTap: () => onArticleClick(a),
          onBookmarkToggle: () => onBookmarkToggle(a.id),
        );
      }).toList(),
    );
  }
}
