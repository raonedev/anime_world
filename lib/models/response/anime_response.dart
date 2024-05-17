// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../anime.dart';
import '../pagination_detail.dart';

class AnimeResponse extends Equatable {
  final PaginationDetail? pagination;
  final List<Anime> data;

  const AnimeResponse({
    required this.pagination,
    required this.data,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

  factory AnimeResponse.fromMap(Map<String, dynamic> map) {
    return AnimeResponse(
      pagination: map['pagination'] != null
          ? PaginationDetail.fromMap(map['pagination'] as Map<String, dynamic>)
          : null,
      data: List<Anime>.from(
        (map['data'] as List<dynamic>).map<Anime>(
          (x) => Anime.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory AnimeResponse.fromJson(String source) =>
      AnimeResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
