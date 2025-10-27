import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CategoriesScreen extends StatefulWidget {
  final Function(String) onCategorySelect;
  const CategoriesScreen({super.key, required this.onCategorySelect});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: AppConstants.categories.map((cat) {
          return CategoryChip(
            id: cat['id']!,
            label: cat['label']!,
            icon: cat['icon'],
            isSelected: selected == cat['id'],
            onSelected: (id) {
              setState(() => selected = id);
              widget.onCategorySelect(id);
            },
          );
        }).toList(),
      ),
    );
  }
}

/// A single selectable category chip used by [CategoriesScreen].
class CategoryChip extends StatelessWidget {
  final String id;
  final String label;
  final IconData? icon;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const CategoryChip({
    super.key,
    required this.id,
    required this.label,
    this.icon,
    this.isSelected = false,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16),
            const SizedBox(width: 6),
          ],
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (_) => onSelected(id),
      // Use a slightly transparent variant of the primary color for selection
      selectedColor: Color.alphaBlend(
        Theme.of(context).colorScheme.primary.withAlpha(31),
        Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
