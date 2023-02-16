import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FeedCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;

  const FeedCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.xl2.bold.make().pOnly(bottom: 6),
                Text(
                  content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ).opacity(value: 0.5)
              ],
            ).pOnly(left: 12),
          )
        ],
      ).p12(),
    );
  }
}