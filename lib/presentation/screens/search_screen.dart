import 'package:animeworld/constants/colors.dart';
import 'package:animeworld/presentation/manager/search_bloc/search_bloc.dart';
import 'package:animeworld/presentation/screens/common/searchtile.dart';
import 'package:animeworld/presentation/screens/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CupertinoSearchTextField(
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: white,
            ),
            itemColor: white,
            style: Theme.of(context).textTheme.bodyMedium,
            onSubmitted: (query) {
              context.read<SearchBloc>().add(SearchAction(query));
            },
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: white,
              ),
            );
          } else if (state is SearchFailedState) {
            return Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else if (state is SearchSucessState) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: state.response.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                InfoScreen(anime: state.response.data[index]),
                          ),
                        ),
                        child: SearchTile(
                          anime: state.response.data[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is SearchInitial) {
            return Center(
              child: Text(
                "Search here",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
