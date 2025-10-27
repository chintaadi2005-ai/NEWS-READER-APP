import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final Function(String) onCategorySelect;
  const CategoriesScreen({super.key, required this.onCategorySelect});

  final List<Map<String, String>> categories = const [
    {'id': 'tech', 'label': 'Technology'},
    {'id': 'sports', 'label': 'Sports'},
    {'id': 'business', 'label': 'Business'},
    {'id': 'health', 'label': 'Health'},
    {'id': 'entertainment', 'label': 'Entertainment'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(12),
      crossAxisCount: 2,
      childAspectRatio: 3 / 1,
      children: categories.map((c) {
        return Card(
          child: InkWell(
            onTap: () => onCategorySelect(c['id']!),
            child: Center(child: Text(c['label']!)),
          ),
        );
      }).toList(),
    );
  }
}
