part of 'apirequest_bloc.dart';

sealed class ApirequestEvent extends Equatable {
  const ApirequestEvent();

  @override
  List<Object> get props => [];
}

class FetchApirequest extends ApirequestEvent {
  final String query;
  final int page;
  final int limit;

  const FetchApirequest(
      {required this.query, required this.page, required this.limit});
}
