/// One bullet in an article card: a check for [ArticlePoint.good], a warning
/// for [ArticlePoint.bad].
class ArticlePoint {
  const ArticlePoint.good(this.text) : isGood = true;

  const ArticlePoint.bad(this.text) : isGood = false;

  final String text;
  final bool isGood;
}
