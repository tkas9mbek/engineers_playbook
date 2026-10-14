/// Who is using the transfers screen.
///
/// The strategy version only uses this to pick a strategy once, in the demo
/// switcher. The conditional version switches on it all over the view.
enum TransferAudience {
  standard('Adult'),
  child('Child');

  const TransferAudience(this.label);

  final String label;
}
