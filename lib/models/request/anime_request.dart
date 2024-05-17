class AnimeRequest {
  String query;
  final int page;
  final int limit;

  AnimeRequest(
    this.query,
    this.page, {
    this.limit = 2,
  });
}
