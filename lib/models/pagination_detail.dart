// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaginationDetail extends Equatable {
  final int? lastPageVisible;
  final bool? hasNextPage;
  final int? currentPage;
  final Items? items;

  const PaginationDetail({
    required this.lastPageVisible,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  @override
  List<Object?> get props => [
        lastPageVisible,
        hasNextPage,
        currentPage,
        items,
      ];

  factory PaginationDetail.fromMap(Map<String, dynamic> map) {
    return PaginationDetail(
      lastPageVisible: map['last_visible_page'] != null
          ? map['last_visible_page'] as int
          : null,
      hasNextPage:
          map['has_next_page'] != null ? map['has_next_page'] as bool : null,
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      items: map['items'] != null
          ? Items.fromMap(map['items'] as Map<String, dynamic>)
          : null,
    );
  }

  factory PaginationDetail.fromJson(String source) =>
      PaginationDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Items extends Equatable {
  final int? count;
  final int? total;
  final int? perPage;

  const Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  @override
  List<Object?> get props => [
        count,
        total,
        perPage,
      ];

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      count: map['count'] != null ? map['count'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      perPage: map['per_page'] != null ? map['per_page'] as int : null,
    );
  }

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);
}
