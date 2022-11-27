import 'package:equatable/equatable.dart';

class PaginatedResponse<T> extends Equatable {
  final int? currentPage;
  final List<T>? data;
  final String? prevPageUrl;
  final String? nextPageUrl;
  final int? count;
  final int? pages;

  const PaginatedResponse({
    this.currentPage,
    this.data,
    this.count,
    this.pages,
    this.prevPageUrl,
    this.nextPageUrl,
  });

  PaginatedResponse<T> copyWith({
    int? currentPage,
    List<T>? data,
    String? prevPageUrl,
    String? nextPageUrl,
    int? count,
    int? pages
  }) {
    return PaginatedResponse(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      count: count ?? this.count,
      pages: pages ?? this.pages
    );
  }

  @override
  List<Object?> get props => [
    currentPage,
    data,
    prevPageUrl,
    nextPageUrl,
    count,
    pages
  ];

  @override
  bool get stringify => true;
}
