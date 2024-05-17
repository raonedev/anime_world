part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSucessState extends SearchState {
  final AnimeResponse response;

  const SearchSucessState({required this.response});
}

final class SearchFailedState extends SearchState {
  final String message;

  const SearchFailedState({required this.message});
}
