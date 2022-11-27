
import 'package:rick_and_morty/src/features/domain/entities/paginated_response.dart';

class PaginatedResponseModel<T> extends PaginatedResponse<T> {
  const PaginatedResponseModel({
    List<T>? data,
    int currentPage = 1,
    int? pages,
    int? count,
    String? nextPageUrl,
    String? prevPageUrl,
  }) : super (
    data: data,
    currentPage: currentPage,
    pages: pages,
    count: count,
    nextPageUrl: nextPageUrl,
    prevPageUrl: prevPageUrl,
  );

  factory PaginatedResponseModel.fromJson(Map<String, dynamic> json, List<T> data, int current) {
    return PaginatedResponseModel(
      data: data,
      currentPage : current,
      count: json['count'],
      pages: json['pages'],
      nextPageUrl : json['next'],
      prevPageUrl : json['prev'],
    );
  }
}
