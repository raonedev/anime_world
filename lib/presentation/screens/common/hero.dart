import 'dart:developer';

import 'package:animeworld/presentation/screens/info_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/colors.dart';
import '../../../models/anime.dart';

class herocard extends StatelessWidget {
  const herocard({
    super.key,
    required this.scale,
    required this.anime,
  });

  final double scale;
  final Anime anime;

  // Function to open YouTube URL
  Future<void> _launchYouTubeURL({required String? videoId}) async {
    final youtubeUrl = 'https://www.youtube.com/watch?v=$videoId';
    if (await canLaunchUrl(Uri.parse(youtubeUrl))) {
      await launchUrl(Uri.parse(youtubeUrl));
    } else {
      throw 'Could not launch $youtubeUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: // rating and likes & watch on youtube
              Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.star_fill,
                color: gold,
                size: 16,
              ),
              Text(
                '${anime.score ?? 0} |  ${anime.favorites!}votes',
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                      height: 1.2,
                    ),
              ),
              const Spacer(),
              // watch youtube
              InkWell(
                onTap: () {
                  log(anime.trailer!.youtubeId!);
                  _launchYouTubeURL(videoId: anime.trailer!.youtubeId);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.play_circle,
                        color: white,
                      ),
                      SizedBox(width: 2),
                      Text("Watch Trailer")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // main card
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => InfoScreen(anime: anime))),
          child: Container(
            margin: EdgeInsets.only(
              right: 30,
              top: 100 - scale * 25,
              bottom: 60,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    anime.images!.jpg!.largeImageUrl!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 200,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.transparent,
                  ],
                ),
              ),
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime.titleEnglish ?? anime.title ?? "",
                    style:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(),
                  ),
                  Text(
                    anime.duration ?? "",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
