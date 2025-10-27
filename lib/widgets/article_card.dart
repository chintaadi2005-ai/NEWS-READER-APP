import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final VoidCallback onBookmarkToggle;

  const ArticleCard({
    super.key,
    required this.article,
    required this.onTap,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 110,
              height: 80,
              child: article.imageUrl.isNotEmpty
                  ? (article.imageUrl.startsWith('http')
                      ? Image.network(article.imageUrl,
                          fit: BoxFit.cover, errorBuilder: (_, __, ___) {
                          return const Icon(Icons.image, size: 48);
                        })
                      : Image.asset(article.imageUrl, fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                          return const Icon(Icons.image, size: 48);
                        }))
                  : const Icon(Icons.image, size: 48),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(article.category,
                          style: Theme.of(context).textTheme.bodySmall),
                      const Spacer(),
                      IconButton(
                        onPressed: onBookmarkToggle,
                        icon: Icon(article.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
