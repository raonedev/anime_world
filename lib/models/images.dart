import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImagesModel extends Equatable {
  final Jpg? jpg;
  final Webp? webp;

  const ImagesModel({
    required this.jpg,
    required this.webp,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      jpg: map['jpg'] != null
          ? Jpg.fromMap(map['jpg'] as Map<String, dynamic>)
          : null,
      webp: map['webp'] != null
          ? Webp.fromMap(map['webp'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ImagesModel.fromJson(String source) =>
      ImagesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Jpg extends Equatable {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const Jpg({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  @override
  List<Object?> get props => [imageUrl, smallImageUrl, largeImageUrl];

  factory Jpg.fromMap(Map<String, dynamic> map) {
    return Jpg(
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      smallImageUrl: map['small_image_url'] != null
          ? map['small_image_url'] as String
          : null,
      largeImageUrl: map['large_image_url'] != null
          ? map['large_image_url'] as String
          : null,
    );
  }

  factory Jpg.fromJson(String source) =>
      Jpg.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Webp extends Equatable {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const Webp({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  @override
  List<Object?> get props => [imageUrl, smallImageUrl, largeImageUrl];

  factory Webp.fromMap(Map<String, dynamic> map) {
    return Webp(
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      smallImageUrl: map['small_image_url'] != null
          ? map['small_image_url'] as String
          : null,
      largeImageUrl: map['large_image_url'] != null
          ? map['large_image_url'] as String
          : null,
    );
  }
  factory Webp.fromJson(String source) =>
      Webp.fromMap(json.decode(source) as Map<String, dynamic>);
}
