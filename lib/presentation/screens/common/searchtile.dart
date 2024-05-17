import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/anime.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  anime.images!.jpg!.imageUrl!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  anime.title ?? anime.titleEnglish ?? 'Unknown',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  anime.synopsis ?? 'Unknown',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: gold,
                      size: 16,
                    ),
                    Text(
                      '${anime.score} \t ${anime.favorites ?? "0"}votes',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            height: 1.2,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
