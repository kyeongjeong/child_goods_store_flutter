enum EProductStatus {
  noUsage('noUsage', '새거에요'),
  littleUsage('littleUsage', '조금 썼어요'),
  manyUsage('manyUsage', '많이 썼어요'),
  extremeUsage('extremeUsage', '헌거에요');

  final String key;
  final String text;

  const EProductStatus(
    this.key,
    this.text,
  );
}
