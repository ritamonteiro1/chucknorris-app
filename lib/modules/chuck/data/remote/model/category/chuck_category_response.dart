class ChuckCategoryResponse {
  ChuckCategoryResponse(
    this.title,
  );

  factory ChuckCategoryResponse.fromJson(json) =>
      ChuckCategoryResponse(json ?? '');

  final String? title;

  static List<ChuckCategoryResponse> fromJsonList(List<dynamic>? json) =>
      json?.map((i) => ChuckCategoryResponse.fromJson(i)).toList() ?? [];
}
