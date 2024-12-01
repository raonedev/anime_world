import 'package:animeworld/constants/themes.dart';
import 'package:animeworld/data/repository/api_repository.dart';
import 'package:animeworld/presentation/manager/api_request_bloc/apirequest_bloc.dart';
import 'package:animeworld/presentation/manager/search_bloc/search_bloc.dart';
import 'package:animeworld/presentation/screens/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AnimeAPiServices service = AnimeAPiServices(Dio());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApirequestBloc(service: service)
            ..add(
              const FetchApirequest(
                  query: 'trending tv anime', page: 1, limit: 8),
            ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(service: service),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}

/*

          BlocProvider(
            create: (context) => ApirequestBloc(service: service)
              ..add(
                const FetchApirequest(
                    query: 'trending tv anime', page: 1, limit: 8),
              ),
          ),
          BlocProvider(
            create: (context) => SearchBloc(service: service),
          ),

          */
