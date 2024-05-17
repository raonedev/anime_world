part of 'apirequest_bloc.dart';

sealed class ApirequestState extends Equatable {
  const ApirequestState();

  @override
  List<Object> get props => [];
}

final class ApirequestLoading extends ApirequestState {}

final class ApirequestLoaded extends ApirequestState {
  final AnimeResponse response;

  const ApirequestLoaded({required this.response});
}

final class ApirequestFailed extends ApirequestState {
  final String message;

  const ApirequestFailed(this.message);

  @override
  List<Object> get props => [message];
}
