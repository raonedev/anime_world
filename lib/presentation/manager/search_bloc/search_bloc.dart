import 'package:animeworld/models/response/anime_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/api_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AnimeAPiServices service;
  SearchBloc({required this.service}) : super(SearchInitial()) {
    on<SearchAction>((event, emit) async {
      emit(SearchLoadingState());
      await service
          .getAnime(limit: 12, page: 1, q: event.query)
          .then((value) => emit(SearchSucessState(
                response: value.data,
              )))
          .catchError((error) => emit(SearchFailedState(
                message: error.toString(),
              )));
    });
  }
}
