class Article {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final String content;
  final bool isBookmarked;

  Article({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.content,
    this.isBookmarked = false,
  });

  Article copyWith({
    String? id,
    String? title,
    String? category,
    String? imageUrl,
    String? content,
    bool? isBookmarked,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
