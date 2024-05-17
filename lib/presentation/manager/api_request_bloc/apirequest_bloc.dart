import 'package:animeworld/data/repository/api_repository.dart';
import 'package:animeworld/models/response/anime_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apirequest_event.dart';
part 'apirequest_state.dart';

class ApirequestBloc extends Bloc<ApirequestEvent, ApirequestState> {
  final AnimeAPiServices service;
  ApirequestBloc({required this.service}) : super(ApirequestLoading()) {
    on<FetchApirequest>((event, emit) async {
      emit(ApirequestLoading());
      final response = await service.getAnime(
        limit: 10,
        page: 1,
        q: event.query,
      );

      if (response.response.statusCode == 200) {
        AnimeResponse responsedata = response.data;
        emit(ApirequestLoaded(response: responsedata));
      } else {
        emit(const ApirequestFailed("something went wrong"));
      }
    });
  }
}
