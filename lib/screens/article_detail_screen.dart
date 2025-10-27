import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;
  final VoidCallback onBack;
  final VoidCallback onBookmarkToggle;

  const ArticleDetailScreen({
    super.key,
    required this.article,
    required this.onBack,
    required this.onBookmarkToggle,
  });

  void _showArPreview(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SizedBox(
        height: 260,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text('AR Preview (dummy)',
                style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            const Icon(Icons.view_in_ar, size: 64),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Launch AR (dummy)')));
              },
              child: const Text('Launch AR'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  late final Widget imageWidget;

  if (article.imageUrl.isNotEmpty) {
    if (article.imageUrl.startsWith('http')) {
      imageWidget = Image.network(
        article.imageUrl,
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const SizedBox(height: 180, child: Center(child: Icon(Icons.image))),
      );
    } else {
      imageWidget = Image.asset(
        article.imageUrl,
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const SizedBox(height: 180, child: Center(child: Icon(Icons.image))),
      );
    }
  } else {
    imageWidget = const SizedBox.shrink();
  }

  return Column(
    children: [
        Row(
          children: [
            IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back)),
            const SizedBox(width: 8),
            Expanded(
                child: Text(article.title,
                    style: Theme.of(context).textTheme.titleLarge)),
            IconButton(
                onPressed: onBookmarkToggle,
                icon: Icon(article.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border)),
          ],
        ),
        // image widget (network or asset)
        imageWidget,
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(article.content),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => _showArPreview(context),
                icon: const Icon(Icons.view_in_ar),
                label: const Text('AR Preview'),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text('Share')),
            ],
          ),
        ),
      ],
    );
  }
}
