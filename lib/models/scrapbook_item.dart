class ScrapbookItem {
  final String imageUrl;
  final String caption;
  final String date;
  final bool isLocal;

  ScrapbookItem({
    required this.imageUrl,
    required this.caption,
    required this.date,
    this.isLocal = false,
  });
}
