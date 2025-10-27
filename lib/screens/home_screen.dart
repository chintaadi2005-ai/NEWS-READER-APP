import 'package:flutter/material.dart';
import '../models/article.dart';
import '../widgets/article_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Article> articles;
  final Function(Article) onArticleClick;
  final Function(String) onBookmarkToggle;
  final VoidCallback onSearchClick;

  const HomeScreen({
    super.key,
    required this.articles,
    required this.onArticleClick,
    required this.onBookmarkToggle,
    required this.onSearchClick,
  });

  void _showArPreview(BuildContext context, Article article) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SizedBox(
        height: 280,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'AR Preview (dummy)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.view_in_ar, size: 64),
                      SizedBox(height: 8),
                      Text('This is a placeholder for AR preview.'),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Launch AR (dummy)')),
                  );
                },
                child: const Text('Launch AR'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // ✅ Top bar with logo + title + search button
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
              child: Row(
                children: [
                  // App logo
                  Image.asset(
                    'assets/images/app_logo.png',
                    height: 36,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.newspaper,
                      size: 36,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(width: 8),

                  // App name
                  Text(
                    'News Reader AR',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),

                  // Search button
                  IconButton(
                    onPressed: onSearchClick,
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),

            // ✅ List of articles
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 80),
                children: [
                  for (final a in articles)
                    ArticleCard(
                      article: a,
                      onTap: () => onArticleClick(a),
                      onBookmarkToggle: () => onBookmarkToggle(a.id),
                    ),
                ],
              ),
            ),
          ],
        ),

        // ✅ Floating AR Preview button
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                if (articles.isNotEmpty) {
                  _showArPreview(context, articles.first);
                }
              },
              label: const Text('AR Preview'),
              icon: const Icon(Icons.view_in_ar),
            ),
          ),
        ),
      ],
    );
  }
}
