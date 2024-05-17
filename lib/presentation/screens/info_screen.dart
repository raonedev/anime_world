import 'dart:ui';

import 'package:animeworld/constants/colors.dart';
import 'package:animeworld/models/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.anime});
  final Anime anime;

  // Function to open YouTube URL
  Future<void> _launchYouTubeURL({required String videoId}) async {
    final youtubeUrl = 'https://www.youtube.com/watch?v=$videoId';
    if (await canLaunchUrl(Uri.parse(youtubeUrl))) {
      await launchUrl(Uri.parse(youtubeUrl));
    } else {
      throw 'Could not launch $youtubeUrl';
    }
  }

  // Function to open YouTube URL
  Future<void> _launchWebURL({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16),
            decoration: BoxDecoration(
              color: white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              CupertinoIcons.chevron_back,
              color: white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // background blur
          Container(
            key: ValueKey<String>(
                anime.images!.jpg!.largeImageUrl!), //TODO:remove null check
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  anime.images!.jpg!.smallImageUrl!,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                color: grey.withOpacity(0.4),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // hero image
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      anime.images!.jpg!.largeImageUrl!,
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: grey,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),

                    // MAIN COLUMN

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // title
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                anime.titleEnglish ?? anime.title ?? "unknown",
                                overflow: TextOverflow.fade,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            const SizedBox(width: 10),
                            anime.approved ?? false
                                ? const Icon(
                                    CupertinoIcons.checkmark_seal_fill,
                                    color: white,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // label
                        Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: [
                            label(context, anime.source ?? "source"),
                            label(context, anime.type ?? "type"),
                            label(context, anime.status ?? "status"),
                            label(context, anime.year.toString()),
                          ],
                        ),

                        const SizedBox(height: 20),
                        // rating and likes & watch on youtube
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.star_fill,
                              color: gold,
                              size: 16,
                            ),
                            Text(
                              '${anime.score} \t ${anime.favorites ?? "0"}k votes',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    decorationThickness: 2,
                                    height: 1.2,
                                  ),
                            ),
                            const Spacer(),
                            // watch youtube
                            GestureDetector(
                              onTap: () => _launchYouTubeURL(
                                  videoId:
                                      anime.trailer!.youtubeId ?? "unknown"),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
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
                        const SizedBox(height: 20),
                        // saperator
                        const Divider(color: white),

                        const SizedBox(height: 20),
                        Text(
                          'About the Anime',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          anime.synopsis ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => _launchWebURL(url: anime.url ?? ""),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: gold,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            "Get more Info",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      ),
    );
  }

  Container label(BuildContext context, String labelText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
          // width: 2.0,
        ),
      ),
      child: Text(
        labelText,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
