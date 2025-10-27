import '../models/article.dart';

final List<Article> mockArticles = List.generate(100, (i) {
  final id = (i + 1).toString();
  final categories = ['Technology', 'Sports', 'Business', 'Health', 'Entertainment'];
  final category = categories[i % categories.length];
  final title = '$category News Headline #$id';
  // Use picsum.photos seeded images for stable placeholder thumbnails
  final imageUrl = 'https://picsum.photos/seed/article_$id/600/400';
  final content =
    'This is sample content for article #$id in $category. It demonstrates content layout for the News Reader demo.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.';

  return Article(
    id: id,
    title: title,
    category: category,
    imageUrl: imageUrl,
    content: content,
  );
});
