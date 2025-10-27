import 'package:flutter/material.dart';
import '../models/article.dart';
import '../widgets/article_card.dart';

class SearchScreen extends StatefulWidget {
  final List<Article> articles;
  final Function(Article) onArticleClick;
  final VoidCallback onBack;

  const SearchScreen({
    super.key, 
    required this.articles, 
    required this.onArticleClick,
    required this.onBack,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final results = widget.articles
        .where((a) => a.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Column(
      children: [
        // Back navigation bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              const Text('Search'),
              const Spacer(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search articles...'),
            onChanged: (v) => setState(() => query = v),
          ),
        ),
        Expanded(
          child: results.isEmpty
              ? const Center(child: Text('No results'))
              : ListView(
                  padding: const EdgeInsets.only(bottom: 80),
                  children: results.map((a) {
                    return ArticleCard(
                      article: a,
                      onTap: () => widget.onArticleClick(a),
                      onBookmarkToggle:
                          () {}, // no-op here; bookmark handled elsewhere
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}
