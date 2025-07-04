// widgets/category_card.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/categories/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String? defaultImageUrl = category.mediaurls?.images?.isNotEmpty == true
        ? category.mediaurls?.images?.first.defaul
        : null;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          /// Image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: defaultImageUrl != null
                  ? CachedNetworkImage(
                imageUrl: defaultImageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2)),
                errorWidget: (_, __, ___) =>
                const Icon(Icons.broken_image),
              )
                  : const Icon(Icons.image_not_supported),
            ),
          ),

          /// Title Overlay
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category.title ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'ProductSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
