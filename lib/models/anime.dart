// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'images.dart';
import 'trailers.dart';

class Anime extends Equatable {
  final int? id;
  final String? url;
  final ImagesModel? images;
  final Trailers? trailer;
  final bool? approved;
  final String? title;
  final String? titleEnglish;
  final String? type;
  final String? source;
  final String? status;
  final String? duration;
  final double? score;
  final int? favorites;
  final String? synopsis;
  final String? backgorund;
  final String? season;
  final int? year;

  const Anime({
    required this.id,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.title,
    required this.titleEnglish,
    required this.type,
    required this.source,
    required this.status,
    required this.duration,
    required this.score,
    required this.favorites,
    required this.synopsis,
    required this.backgorund,
    required this.season,
    required this.year,
  });

  factory Anime.fromMap(Map<String, dynamic> map) {
    return Anime(
      id: map['mal_id'] != null ? map['mal_id'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      images: map['images'] != null
          ? ImagesModel.fromMap(map['images'] as Map<String, dynamic>)
          : null,
      trailer: map['trailer'] != null
          ? Trailers.fromMap(map['trailer'] as Map<String, dynamic>)
          : null,
      approved: map['approved'] != null ? map['approved'] as bool : null,
      title: map['title'] != null ? map['title'] as String : null,
      titleEnglish:
          map['title_english'] != null ? map['title_english'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      score: map['score'] != null ? map['score'] as double : null,
      favorites: map['favorites'] != null ? map['favorites'] as int : null,
      synopsis: map['synopsis'] != null ? map['synopsis'] as String : null,
      backgorund:
          map['background'] != null ? map['background'] as String : null,
      season: map['season'] != null ? map['season'] as String : null,
      year: map['year'] != null ? map['year'] as int : null,
    );
  }

  factory Anime.fromJson(String source) =>
      Anime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        url,
        images,
        trailer,
        title,
        titleEnglish,
        type,
        source,
        season,
        year,
        backgorund,
      ];
}
