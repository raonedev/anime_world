import 'dart:convert';

import 'package:equatable/equatable.dart';

class Trailers extends Equatable {
  final String? youtubeId;
  final String? url;
  final String? embedeUrl;
  final Images? images;

  const Trailers({
    required this.youtubeId,
    required this.url,
    required this.embedeUrl,
    required this.images,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

  factory Trailers.fromMap(Map<String, dynamic> map) {
    return Trailers(
      youtubeId: map['youtube_id'] != null ? map['youtube_id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      embedeUrl: map['embed_url'] != null ? map['embed_url'] as String : null,
      images: map['images'] != null
          ? Images.fromMap(map['images'] as Map<String, dynamic>)
          : null,
    );
  }

  factory Trailers.fromJson(String source) =>
      Trailers.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Images extends Equatable {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumimageUrl;
  final String? largeImageUrl;
  final String? maxImageUrl;

  const Images({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.mediumimageUrl,
    required this.largeImageUrl,
    required this.maxImageUrl,
  });
  @override
  List<Object?> get props => throw UnimplementedError();

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      smallImageUrl: map['small_image_url'] != null
          ? map['small_image_url'] as String
          : null,
      mediumimageUrl: map['medium_image_url'] != null
          ? map['medium_image_url'] as String
          : null,
      largeImageUrl: map['large_image_url'] != null
          ? map['large_image_url'] as String
          : null,
      maxImageUrl: map['maximum_image_url'] != null
          ? map['maximum_image_url'] as String
          : null,
    );
  }

  factory Images.fromJson(String source) =>
      Images.fromMap(json.decode(source) as Map<String, dynamic>);
}
