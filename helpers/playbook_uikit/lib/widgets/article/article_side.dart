import 'package:playbook_uikit/widgets/article/article_point.dart';

/// One side of a comparison, e.g. "Conditional" or "Strategy".
class ArticleSide {
  const ArticleSide({
    required this.title,
    required this.tagline,
    required this.points,
  });

  final String title;
  final String tagline;
  final List<ArticlePoint> points;
}
