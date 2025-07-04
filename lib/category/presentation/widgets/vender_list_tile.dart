
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:verbose_task/category/data/venders/venders_model.dart';

class VendorTile extends StatelessWidget {
  final Datum vendor;
  final VoidCallback onTap;

  const VendorTile({
    super.key,
   required this.vendor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = vendor.mediaurls.images.isNotEmpty
        ? vendor.mediaurls.images.first.imageDefault
        : Icon(Icons.broken_image);

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl.toString(),
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(
                      width: 72,
                      height: 72,
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Text block
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        vendor.name?? ' no name ',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),

                      // Location
                      Text(
                        vendor.address,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Prep time • distance
                      Row(
                        children: [
                          Text(
                            'Prepare in 10 mins',
                            style: theme.textTheme.bodySmall,
                          ),
                          const Text('  •  '),
                          Text(
                            "${vendor.distance.toStringAsFixed(2)}KM",
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // dot pattern

                      const DottedLine(
                        dashLength: 4,
                        dashGapLength: 4,
                        lineThickness: 1,
                        dashColor: Colors.black12,
                      ),

                      const SizedBox(height: 6),

                      // Ratings
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 12, color: Colors.white),
                                const SizedBox(width: 2),
                                Text(
                                  vendor.ratings.toStringAsFixed(1),
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${vendor.ratingsCount} rated',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /*LayoutBuilder(
            builder: (_, constraints) {
              // Draw small dashes across width
              const dashWidth = 4.0;
              const dashSpace = 4.0;
              final dashCount =
              (constraints.maxWidth / (dashWidth + dashSpace)).floor();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  dashCount,
                      (_) => const SizedBox(
                    width: dashWidth,
                    height: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    ),
                  ),
                ),
              );
            },
          ),*/
        ],
      ),
    );
  }
}
