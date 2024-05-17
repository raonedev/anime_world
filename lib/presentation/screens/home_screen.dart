import 'dart:math';
import 'dart:ui';

import 'package:animeworld/constants/colors.dart';
import 'package:animeworld/presentation/manager/api_request_bloc/apirequest_bloc.dart';
import 'package:animeworld/presentation/screens/search_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/search_bloc/search_bloc.dart';
import 'common/hero.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  double viewPortFraction = 0.9;
  double pageoffset = 0;
  int _currentindex = 0;
  @override
  void initState() {
    pageController =
        PageController(initialPage: 0, viewportFraction: viewPortFraction)
          ..addListener(() {
            setState(() {
              pageoffset = pageController.page!;
            });
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Anime World",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<SearchBloc>(context),
                    child: const SearchScreen(),
                  ),
                ),
              );
            },
          ),
          // IconButton(
          //   icon: const Icon(
          //     CupertinoIcons.bell,
          //     color: white,
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: BlocBuilder<ApirequestBloc, ApirequestState>(
        builder: (context, state) {
          if (state is ApirequestLoaded) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // background blur
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    key: ValueKey<String>(state
                        .response.data[_currentindex].images!.jpg!.imageUrl!),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(state.response
                            .data[_currentindex].images!.jpg!.smallImageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        color: grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                // pageviwer
                FractionallySizedBox(
                  heightFactor: 0.8,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentindex = value;
                      });
                    },
                    itemCount: state.response.data.length,
                    itemBuilder: (context, index) {
                      // scale
                      double scale = max(viewPortFraction,
                          (1 - (pageoffset - index).abs()) + viewPortFraction);

                      // angle
                      double angle = (pageoffset - index).abs();
                      if (angle > 0.5) {
                        angle = 1 - angle;
                      }
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(angle),
                        child: herocard(
                          scale: scale,
                          anime: state.response.data[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ApirequestLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                "something went wrong",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: primary),
              ),
            );
          }
        },
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: white,
            unselectedItemColor: grey,
            useLegacyColorScheme: false,
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  CupertinoIcons.film,
                  color: white,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  CupertinoIcons.search,
                  color: white,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  CupertinoIcons.ticket,
                  color: white,
                ),
              ),
            ],
            onTap: (value) {},
          ),
        ),
      ),
    );
  }
}
